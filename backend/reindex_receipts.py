"""Re-index all receipts into the vector store after ChromaDB reset."""
import sys
import os

# Add parent directory to path
sys.path.insert(0, os.path.dirname(os.path.dirname(os.path.abspath(__file__))))

from sqlalchemy.orm import Session
from app.database.connection import get_db
from app.models.receipt import Receipt
from app.services.vector_store import VectorStore

def reindex_all_receipts():
    """Re-index all confirmed receipts into the vector store."""
    print("🔄 Starting receipt re-indexing...")
    
    # Get vector store
    vector_store = VectorStore()
    
    # Get database session
    db = next(get_db())
    
    try:
        # Get all receipts with extracted data
        receipts = db.query(Receipt).filter(
            Receipt.extracted_date.isnot(None)
        ).all()
        
        print(f"📊 Found {len(receipts)} receipts to re-index")
        
        indexed_count = 0
        failed_count = 0
        
        for receipt in receipts:
            try:
                # Create receipt data dict
                receipt_data = {
                    'extracted_date': str(receipt.extracted_date) if receipt.extracted_date else None,
                    'extracted_time': str(receipt.extracted_time) if receipt.extracted_time else None,
                    'sender': receipt.sender,
                    'receiver': receipt.receiver,
                    'amount': float(receipt.amount) if receipt.amount else None,
                    'note': receipt.note,
                    'transaction_type': receipt.transaction_type or 'unknown',
                }
                
                vector_store.index_receipt(receipt.id, receipt_data)
                indexed_count += 1
                
                if indexed_count % 10 == 0:
                    print(f"  ✅ Indexed {indexed_count}/{len(receipts)} receipts")
                    
            except Exception as e:
                print(f"  ❌ Failed to index receipt {receipt.id}: {e}")
                failed_count += 1
        
        print(f"\n✅ Re-indexing complete!")
        print(f"   - Successfully indexed: {indexed_count}")
        print(f"   - Failed: {failed_count}")
        print(f"   - Total in vector store: {vector_store.get_count()}")
        
    except Exception as e:
        print(f"❌ Error during re-indexing: {e}")
        import traceback
        traceback.print_exc()
    finally:
        db.close()

if __name__ == "__main__":
    reindex_all_receipts()

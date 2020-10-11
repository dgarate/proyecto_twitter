json.pagination do
    json.current         collection.current_page
    json.previous        collection.prev_page
    json.next            collection.next_page
    json.limit           collection.limit_value
    json.total_pages     collection.total_pages
    json.total_count     collection.total_count
  
    # json.data            collection # if want to send the data as well. In my case I am sending data. 
  end
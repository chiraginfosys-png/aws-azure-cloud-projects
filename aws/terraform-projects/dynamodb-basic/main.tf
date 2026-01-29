resource "aws_dynamodb_table" "cms001dynamodb" {
  name         = "grocery_list"
  hash_key     = "grocery_id"
  billing_mode = "PAY_PER_REQUEST"
  attribute {
    name = "grocery_id"
    type = "N"
  }
}

resource "aws_dynamodb_table_item" "cms001dynamodb_item" {
  table_name = aws_dynamodb_table.cms001dynamodb.name
  hash_key   = aws_dynamodb_table.cms001dynamodb.hash_key

  item = <<ITEM
 {
  "grocery_id": {"N": "1"},
  "grocery_item_name": {"S": "Rice"},
  "grocery_item_qty": {"N": "2"},
  "grocery_item_price": {"N": "10"}
 }
 ITEM
}

resource "aws_dynamodb_table_item" "cms002dynamodb_item" {
  table_name = aws_dynamodb_table.cms001dynamodb.name
  hash_key   = aws_dynamodb_table.cms001dynamodb.hash_key

  item = <<ITEM
  {
   "grocery_id": {"N": "2"},
   "grocery_item_name": {"S": "Bread"},
   "grocery_item_qty": {"N": "1"},
   "grocery_item_price": {"N": "5.20"},
   "grocery_item_type": {"S": "Perishables"}
  }
 ITEM
}

resource "aws_dynamodb_table_item" "cms003dynamodb_item" {
  table_name = aws_dynamodb_table.cms001dynamodb.name
  hash_key   = aws_dynamodb_table.cms001dynamodb.hash_key

  item = <<ITEM
  {
   "grocery_id": {"N": "3"},
   "grocery_item_name": {"S": "Eggs"},
   "grocery_item_qty": {"N": "1"},
   "grocery_item_price": {"N": "5.20"},
   "grocery_item_type": {"S": "Perishables"}
  }
 ITEM
}


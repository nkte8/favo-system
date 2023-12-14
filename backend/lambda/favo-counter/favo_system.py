import boto3

class favo_system:
    def __init__(self, favo_table, user_table = None, endpoint_url = None) -> None:
        self.client = boto3.resource('dynamodb', endpoint_url=endpoint_url)
        self.favo_table = self.client.Table(favo_table)
        if user_table != None:
            self.user_table = self.client.Table(user_table)
        else:
            self.user_table = None

    def favo_user_push(self, user_name):
        return self.table_favocount_push(
            table=self.favo_table,
            key="user_name",
            value=user_name
        )
    def favo_user_read(self, user_name):
        return self.table_favocount_read(
            table=self.favo_table,
            key="user_name",
            value=user_name
        )

    def favo_page_push(self, page_name):
        return self.table_favocount_push(
            table=self.favo_table,
            key="page_url",
            value=page_name
        )

    def favo_page_read(self, page_name):
        return self.table_favocount_read(
            table=self.favo_table,
            key="page_url",
            value=page_name
        )
        
    def table_favocount_push(self, table, key, value):
        current_count = self.table_favocount_read(
                            table=table,
                            key=key,
                            value=value)
        if current_count == None:
            return None
        current_count +=1
        new_item = {
            key: value,
            "favo_count": current_count
        }
        try:
            table.put_item(Item=new_item)
        except Exception as e:
            print('E: Unexpected error')
            print(e)
            return False
        return True

    def table_favocount_read(self, table, key, value):
        try:
            exist_data = table.get_item(
                Key={
                    key: value
                }
            )
            return exist_data['Item']['favo_count']
        except KeyError:
            print('I: No data found in ' + value)
            return 0
        except Exception as e:
            print('E: Unexpected error')
            print(e)
            return None

import boto3

# data structure of dynamodb
# {
#     key: { page_name }
#     value: { favo_count }
# }
class favo_api:

    db_key_name = "Identify"
    db_data_name = "FavoriteCount"

    def __init__(self, favo_table,  endpoint_url = None) -> None:
        self.client = boto3.resource('dynamodb', endpoint_url=endpoint_url)
        self.favo_table = self.client.Table(favo_table)

    def page_fav_read(self, request_key):
        result = {}
        value = self.__table_read(
            table=self.favo_table,
            key=self.db_key_name,
            key_value=request_key,
            request_data_key=self.db_data_name
        )
        match value:
            case _ if value >= 0:
                result = {
                    'statusCode': 200,
                    self.db_data_name: value
                }
            case _ if value < 0:
                result = {
                    'statusCode': value * -1,
                    self.db_data_name: None
                }
  
        return result

    def __table_read(self, table, key, key_value, request_data_key):
        try:
            exist_data = table.get_item(
                Key={
                    key: key_value
                }
            )
            return exist_data['Item'][request_data_key]
        except KeyError:
            print('I: Not found')
            return 0
        except Exception as e:
            print('E: Unexpected error')
            # print(e)
            return -500

    def page_fav_push(self, request_key):
        result = {}
        value = self.__table_read(
            table=self.favo_table,
            key=self.db_key_name,
            key_value=request_key,
            request_data_key=self.db_data_name
        )
        if value < 0:
            return {
                'statusCode': value * -1,
                self.db_data_name: None
            }

        value += 1
        r_val = self.__table_push(
            table=self.favo_table,
            key=self.db_key_name,
            key_value=request_key, 
            request_data_key=self.db_data_name,
            request_data_value=value
        )
        if r_val < 0:
            value -=1

        result = {
            'statusCode': abs(r_val),
            self.db_data_name: value
        }
        return result

    def __table_push(self, table, key, key_value, 
                             request_data_key, request_data_value):
        result = False
        update_item = {
            key: key_value,
            request_data_key: request_data_value
        }
        try:
            table.put_item(Item=update_item)
            result = 200
        except Exception as e:
            result = -500
            print('E: Unexpected error')
            # print(e)
        return result

    def page_fav_pop(self, request_key, pop_count = 1):
        result = {}
        value = self.__table_read(
            table=self.favo_table,
            key=self.db_key_name,
            key_value=request_key,
            request_data_key=self.db_data_name
        )
        if value < 0:
            return {
                'statusCode': value * -1,
                self.db_data_name: None
            }
        if value - pop_count < 0:
            return {
                'statusCode': 204,
                self.db_data_name: value
            }

        value -= pop_count
        r_val = self.__table_push(
            table=self.favo_table,
            key=self.db_key_name,
            key_value=request_key, 
            request_data_key=self.db_data_name,
            request_data_value=value
        )
        if r_val < 0:
            value -=1

        result = {
            'statusCode': abs(r_val),
            self.db_data_name: value
        }
        return result

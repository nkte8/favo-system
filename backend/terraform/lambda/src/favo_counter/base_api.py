import boto3

class base_api:
    def __init__(self, table_name, index_key_name, endpoint_url = None) -> None:
        __table = boto3.resource('dynamodb', endpoint_url=endpoint_url)
        self.table = __table.Table(table_name)
        self.index_key_name = index_key_name

    def table_check(self, index_value, velify_key, velify_secret):
        try:
            exist_data = self.table.get_item(
                Key={
                    self.index_key_name: index_value
                }
            )
            return (
                200 if exist_data['Item'][velify_key] == velify_secret else
                -401)
        except KeyError:
            print('E: Not found')
            return -404
        except Exception as e:
            print('E: Unexpected error')
            return -500
    
    def table_index_exist(self, index_value):
        try:
            exist_data = self.table.get_item(
                Key={
                    self.index_key_name: index_value
                }
            )
            return (exist_data['Item'] != None)
        except KeyError:
            return False
        except Exception as e:
            print('E: Unexpected error')
            # print(e)
            return None

    def table_read(self, index_value, request_data_key):
        try:
            exist_data = self.table.get_item(
                Key={
                    self.index_key_name: index_value
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

    def table_push(self, index_value, data_body):
        update_item = {
            self.index_key_name: index_value
        }
        update_item.update(data_body)
        try:
            self.table.put_item(Item=update_item)
            result = 200
        except Exception as e:
            result = -500
            print('E: Unexpected error')
            # print(e)
        return result
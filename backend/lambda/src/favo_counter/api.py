from base_api import base_api
 
# data structure of dynamodb
# {
#     key: { page_name }
#     value: { favo_count }
# }
class favo_api(base_api):

    db_key_name = "Identify"
    db_data_name = "FavoriteCount"

    rcode_msg_name = "info"
    # cors_domains = 'https://unnamedworks.com'

    def __init__(self, favo_table, rcode_data_name, endpoint_url = None) -> None:
        super().__init__(favo_table, endpoint_url)
        self.rcode_data_name = rcode_data_name

    def r_json(self, s_code, favo_value):
        return {
            'statusCode': s_code,
            'body': {
                self.rcode_data_name: favo_value,
            },
            'isBase64Encoded': False,
            # 'headers': {
            #     'Access-Control-Allow-Headers': 'Content-Type',
            #     'Access-Control-Allow-Origin': self.cors_domain,
            #     'Access-Control-Allow-Methods': 'GET'
            # },
        }

    def page_fav_read(self, request_key):
        result = {}
        value = self.table_read(
            key_name=self.db_key_name,
            key_value=request_key,
            request_data_key=self.db_data_name
        )
        match value:
            case _ if value >= 0:
                result = self.r_json(200,value)
            case _ if value < 0:
                result = self.r_json(abs(value), None)
        return result

    def page_fav_push(self, request_key):
        result = {}
        value = self.table_read(
            key_name=self.db_key_name,
            key_value=request_key,
            request_data_key=self.db_data_name
        )
        if value < 0:
            return self.r_json(abs(value), None)

        value += 1
        r_val = self.table_push(
            key_name=self.db_key_name,
            key_value=request_key, 
            request_data_key=self.db_data_name,
            request_data_value=value
        )
        if r_val < 0:
            value -=1

        return self.r_json(abs(r_val),value)
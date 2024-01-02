from base_api import base_api
import random, string

# data structure of dynamodb
# {
#     key: { page_name }
#     value: { favo_count }
# }
class favo_api(base_api):

    db_key_name = "Identify"
    db_data_name = "FavoriteCount"

    # cors_domains = 'https://unnamedworks.com'

    def __init__(self, table_name, favo_key_name,
                    rcode_key_name = "rc",
                    rmsg_key_name = "msg",
                    auth_key_name = None,
                    endpoint_url = None) -> None:
        super().__init__(table_name=table_name, 
                         index_key_name=self.db_key_name, 
                         endpoint_url=endpoint_url)
        self.favo_key_name = favo_key_name
        self.rmsg_key_name = rmsg_key_name
        self.rcode_key_name = rcode_key_name
        self.auth_key_name = auth_key_name

    def __r_json(self, s_code, favo_value, rmsg_value = None):
        return {
            'statusCode': s_code,
            'body': {
                self.rcode_key_name: s_code,
                self.favo_key_name: favo_value,
                self.rmsg_key_name: rmsg_value,
            },
            'isBase64Encoded': False
            # 'headers': {
            #     'Access-Control-Allow-Headers': 'Content-Type',
            #     'Access-Control-Allow-Origin': self.cors_domain,
            #     'Access-Control-Allow-Methods': 'GET'
            # },
        }
    
    def __randomname(self, n):
        randlst = [random.choice(string.ascii_letters + string.digits) for i in range(n)]
        return ''.join(randlst)
    
    def db_id_register(self, identify_value):
        # register出来ない初期化が行われている
        if self.auth_key_name == None:
            return self.__r_json(abs(500),None)
        
        # すでにユーザが存在する
        if self.table_index_exist(index_value=identify_value):
            return self.__r_json(abs(409),None)
        
        db_data_init_value = 0

        ## 初期化
        ## secretはセキュリティ的観点でサーバ側で生成する
        auth_key_secret = self.__randomname(20)

        data_body = {
            self.db_data_name: db_data_init_value,
            self.auth_key_name: auth_key_secret
        }

        r_val = self.table_push(
            index_value=identify_value, 
            data_body=data_body
        )

        return self.__r_json(abs(r_val),db_data_init_value, auth_key_secret)

    def db_id_auth(self, identify_value, auth_key_secret):
        if self.auth_key_name != None:
            auth_result = self.__db_id_auth(
                    identify_value,auth_key_secret)
            return self.__r_json(abs(auth_result),None)
        else:
            return self.__r_json(abs(-405),None)

    def __db_id_auth(self, index_value, auth_key_secret):
        if auth_key_secret != None:
            return self.table_check(
                index_value=index_value, 
                velify_key=self.auth_key_name,
                velify_secret=auth_key_secret
                )
        else:
            # auth_key_secretの入力がない場合は無条件にエラー
            return -405 
      
    def db_fav_read(self, identify_value,
                        auth_key_secret = None):

        if self.auth_key_name != None:
            auth_result = self.__db_id_auth(
                identify_value,auth_key_secret)
            if auth_result < 0:    
                return self.__r_json(abs(auth_result),None)

        value = int(self.table_read(
            index_value=identify_value,
            request_data_key=self.db_data_name
        ))

        if value >= 0:
            return self.__r_json(200,value)
        else:
            return self.__r_json(abs(value), None)


    def db_fav_push(self, identify_value,
                        auth_key_secret = None):

        data_body = {}
        if self.auth_key_name != None:
            auth_result = self.__db_id_auth(
                identify_value,auth_key_secret)
            if auth_result < 0:    
                return self.__r_json(abs(auth_result),None)
            data_body.update({
                self.auth_key_name: auth_key_secret
            })

        value = int(self.table_read(
            index_value=identify_value,
            request_data_key=self.db_data_name
        ))
        if value < 0:
            return self.__r_json(abs(value), None)

        value += 1
        data_body.update({
            self.db_data_name: value
        })

        r_val = self.table_push(
            index_value=identify_value, 
            data_body=data_body
        )
        if r_val < 0:
            value -=1

        return self.__r_json(abs(r_val),value)
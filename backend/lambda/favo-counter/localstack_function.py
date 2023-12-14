from favo_system import favo_system

favo_table = "favodb"

if __name__ == "__main__": 
    a = favo_system(favo_table, endpoint_url="http://localhost:4566")

    a.favo_page_push("hoge")
    print(a.favo_page_read("hoge"))

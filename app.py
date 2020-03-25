from flask import Flask,render_template,jsonify, make_response
import pymysql
from flask_cors import CORS

app = Flask(__name__)
# r'/*' 是通配符，让本服务器所有的 URL 都允许跨域请求
CORS(app, supports_credentials=True)
@app.after_request
def af_request(resp):
    """
    #请求钩子，在所有的请求发生后执行，加入headers。
    :param resp:
    :return:
    """
    resp = make_response(resp)
    resp.headers['Access-Control-Allow-Origin'] = '*'
    resp.headers['Access-Control-Allow-Methods'] = 'GET,POST'
    resp.headers['Access-Control-Allow-Headers'] = 'x-requested-with,content-type'
    return resp

# #创建mysql连接参数
# db = SQLAlchemy(app)
# app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql+pymysql://root:12345@127.0.0.1:3306/data'
# app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
#
# #表1
# class table1(db.Model):
#     __tablename__='one1'
#     id = db.Column(db.String,primary_key=True)
#     view = db.Column(db.Integer)
#     cart = db.Column(db.Integer)
#     purchase = db.Column(db.Integer)
#
# #表2
# class table2(db.Model):
#     __tablename__='two2'
#     category = db.Column(db.String,primary_key=True)
#     slaes_volume = db.Column(db.Integer)
#     totle_money = db.Column(db.Integer)
# #表3
# class table3(db.Model):
#     __tablename__='three3'
#     day = db.Column(db.Date,primary_key=True)
#     uv = db.Column(db.Integer)
#     pv = db.Column(db.Integer)
#
# #表4
# class table4(db.Model):
#     __tablename__='four4'
#     day = db.Column(db.Date,primary_key=True)
#     view = db.Column(db.Integer)
#     cart = db.Column(db.Integer)
#     removed_form_cart = db.Column(db.Integer)
#     purchase = db.Column(db.Integer)

#表5
# class table5(db.Model):
#     __tablename__='five5'
#     day = db.Column(db.Date,primary_key=True)
#     uv = db.Column(db.Integer)
#     pv = db.Column(db.Integer)

#db.create_all()

'''连接数据库的工具类'''
class DB_operate:
    cur = None

    def __init__(self):
        conn = pymysql.connect(host='127.0.0.1', user='root', password='12345', db='data', charset='utf8')
        self.cur = conn.cursor()

    def select(self, strSQL):
        self.cur.execute(strSQL)
        return self.cur.fetchall()

    def __del__(self):
        self.cur.close()

@app.route('/table/<id>',methods=['GET'])
def result(id):
    nums = ["one","two","three","four","five",]

    sql = "select * from " + nums[int(id)-1]+id + ";"    #查询sql
    sql1 = "select COLUMN_NAME from information_schema.COLUMNS where table_name = \'"+ nums[int(id)-1] + id + "\';"  #查询表字段名sql
    db = DB_operate()
    field = db.select(sql1)
    # print(field)
    fields = []  # 装字段名
    dict = []  # 总的数据
    for f in field:
        fields.append(f[0])
    print(fields)
    data = db.select(sql)
    print(data)
    for row in range(len(data)):
        rows = {}
        for i in range(len(data[row])):
            if isinstance(data[row][i],str):
                rows[fields[i]] = data[row][i]
            elif isinstance(data[row][i],int):
                rows[fields[i]] = data[row][i]
            else:
                rows[fields[i]] = str(data[row][i])
        dict.append(rows)
    print(dict)
    dict = {"msg":"success","data":dict}
    msg = jsonify(dict)
    return msg


@app.route('/')
def hello_world():
    return render_template('index.html')

if __name__ == '__main__':
    app.run()
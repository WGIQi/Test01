create table customer_login(
customer_id int unsigned auto_increment not null primary key comment '用户id',
login_name varchar(20) not null comment'用户名',
psd CHAR(32) not null comment '密码',
user_stats tinyint not null default 1 comment '用户状态，1表示正常，0表示冻结',
modified_time timestamp not null default current_timestamp 
on update current_timestamp comment '最后将修改时间'
)engine=innodb comment='用户登陆表';

create table test_time(
id int,
t1 timestamp default current_timestamp
on update current_timestamp ,
t2 timestamp default current_timestamp,
t3 timestamp on update current_timestamp ,
t4 timestamp  default '2018-01-01'
on update current_timestamp 


)comment'事件类型';


create table customer_level_inf(
customer_level tinyint not null auto_increment comment'会员级别',
level_name varchar(10) not null comment '会员级别名称',
min_point int unsigned not null default 0 comment '该级别最低分', 
max_point int unsigned not null default 0 comment '该级别最高分',  
modified_time timestamp not null default current_timestamp 
on update current_timestamp comment'最后修改时间',
primary key(customer_level)
)comment='用户级别表';





create table customer_inf( 
customer_inf_id int unsigned auto_increment not null comment '自增主键ID',
customer_id int unsigned not null comment 'customer_login 表的自增ID', 
customer_name varchar(20) not null comment'用户真实姓名', 
identity_card_type tinyint not null default 1
comment'证件类型卫1身份证，2军官证，3护照', 
identity_card_no varchar(20) comment'证件号码', 
mobile_phone int unsigned comment'手机号', 
customer_email varchar(50) comment '邮编', 
gender CHAR(2)comment'性别', 
user_point int not null default 0 comment'用户积分', 
register_time timestamp not null comment'注册时间', 
birthday datetime comment'会员生日', 
customer_level tinyint not null default 1 
comment'会员级别:1普通会员，2青铜会员，3白银会员，4黄金会员，5钻石会员',
user_money decimal(8,2) not null default 0.00 comment '用户余额',
modified timestamp not null default current_timestamp
on update current_timestamp comment'最后修改时间', 
primary key(customer_inf_id), 
foreign key(customer_id) references customer_login(customer_id) 
)comment='用户信息表'; 


create table customer_addr (
  customer_addr_id int unsigned auto_increment not null comment '自增主键ID',
  customer_id int unsigned not null comment 'customer_login表的自增ID',
  zip varchar (20) not null comment '右边',
  province varchar (20) not null comment '省份',
  city varchar (20) not null comment '城市',
  district varchar (20) not null comment '区',
  address varchar (202) not null comment '具体的地址',
  is_default tinyint not null comment '是否默认',
  moditied_time timestamp not null default current_timestamp on update current_timestamp comment '最后修改时间',
  primary key (customer_addr_id)
) comment = '用户地址表';

create table customer_point_log(
point_id int unsigned not null auto_increment primary key comment'积分日志ID',
customer_id int unsigned not null comment'用户ID',
source tinyint unsigned not null comment'积分来源：0订单，1登陆，2活动',
refer_number int unsigned not null default 0 comment'积分来源相关编号',
change_point smallint not null default 0 comment'变更积分',
create_time timestamp not null comment'积分日志生成时间'
)comment='用户积分日志表';
)

create table cutomer_balance_log(
balance_id int unsigned not null auto_increment primary key comment'余额日志',
cutomer_id int unsigned not null comment'用户id',
source tinyint unsigned not null default 1 comment'记录来源：1订单，2：退货单',
source_sn int  unsigned not null comment '相关单据id',
create_time timestamp not null default current_timestamp comment'记录生成时间',
amount decimal(8,2) not null default 0.00 comment '变动金额'
)comment='用户余额变动表';

create table customer_login_log(
login_id int unsigned auto_increment not null primary key comment'登陆日志ID',
customer_id int unsigned not null comment'登陆用户ID',
login_time timestamp not null comment'用户登陆时间',
login_ip bigint unsigned not null comment'登陆IP',
login_type tinyint not null comment'登陆类型:0未成功，1成功'
)comment='用户登陆日志表';
)




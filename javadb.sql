--javadb

-- userTBL 테이블 생성
-- no, username, birthYear, addr, mobile
drop table userTBL;

create table userTBL(
    no number(4) constraint pk_userTBL primary key,
    username nvarchar2(10) not null,    --varchar2(20)
    birthYear number(4) not null,
    addr nvarchar2(50),                 --varchar2(50)
    mobile nvarchar2(13)                --varchar2(20)
);

create sequence user_seq;
insert into userTBL(no, username, birthYear, addr, mobile)
values(user_seq.nextval, '홍길동', 2010, '서울시 종로구 123', '010-1234-5678');

commit;

-- shop
-- user : userid, name, paytype
drop table paytype;
create table paytype(
    pay_no number(1) primary key,
    info varchar2(10) not null
);
create sequence paytype_seq;
drop sequence paytype_seq;
insert into paytype values(paytype_seq.nextval, 'card');
insert into paytype values(paytype_seq.nextval, 'cash');
select * from paytype;

drop table shop;
create table suser(
    user_id number(4) primary key,
    name varchar2(20) not null,
    pay_no number(1) not null references paytype(pay_no)
);

create table product(
    product_id number(8) primary key,
    pname varchar2(30) not null,
    price number(8) not null,
    content varchar2(50)
);

create sequence product_seq;

create table sorder(
    order_id number(8) primary key,
    user_id number(4) not null references suser(user_id),
    product_id number(8) not null references product(product_id)
);

alter table sorder add order_date date;

create sequence order_seq;

--insert into sorder values(order_seq.nextval,구매한 id, 상품id, sysdate);


select u.user_id, u.name, u.pay_no, p.info from suser u, paytype p where u.pay_no = p.pay_no;

select * from sorder; 


select * from sorder s, suser u, paytype t, product p
where s.user_id = u.user_id and u.pay_no = t.pay_no and s.product_id = p.product_id;
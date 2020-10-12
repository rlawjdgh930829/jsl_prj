테이블

create table person (
    person_no number(20) primary key,
    person_name varchar2(20) not null,
    person_email varchar2(40) not null,
    person_pwd varchar2(20) not null
);

create table product (
    product_no number(20) primary key,
    product_title varchar2(100) not null,
    product_content varchar2(4000) not null,
    product_price number(20) not null,
    product_img varchar(100),
    product_date varchar2(20) not null,
    person_no number(20) not null,
    foreign key(person_no) references person(person_no)
);

create table reply(
    reply_no number(20) primary key,
    reply_content varchar2(100) not null,
    reply_group number(10) not null,
    reply_order number(10) not null,
    reply_depth number(10) not null,
    person_no number(20) not null,
    product_no number(20) not null,
    foreign key(person_no) references person(person_no),
    foreign key(product_no) references product(product_no) on delete cascade
);

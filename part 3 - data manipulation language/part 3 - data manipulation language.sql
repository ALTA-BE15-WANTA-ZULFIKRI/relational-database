-1. insert 
a.insert into product(product_name,product_type_id)values('product1',1),('product2',1),('product3',1),('product4',2),('product5',2),('product6',2),('product7',3),('product8',3),('product9',3);
b.insert into product(product_name, product_type_id) values ('product1',1),('product2',1);
c.insert into product(product_name, product_type_id,product_description) values ('product3',2),('product4',2),('product5',2);
d.insert into product(product_name, product_type_id,product_description) values('product6',3,'product description 1'),('product7',3,'product description 2'), ('product8',3, 'product description3');
e.insert into payment_method(payment_method_name) values ('credit card'), ('debit card'), ('paypal');
f.insert into user(user_name, user_gender) values ('user1','M'),('user2','F'),('user 3','M'),('user4','F'),('user5','M');
g.insert into transaction(user_id, transaction_date)values(1,curdate()),(2,curdate()),(3,curdate());
h.insert into detail_transaction(transaction_id, product_id, qty) values (1,1,1),(1,2,2),(2,3,3),(2,4,4),(3,5,5),(3,6,6);
i.insert into product(product_name,product_type_id,product_description) values ('product9',3,'product description 4');

-2. select 
a.select user_name from user where user_gender = 'M';
b.select*from product where product_id = 3;
c.select*from user where user_created_date between curdate() - 7 and curdate() - 7 and curdate() and user_name LIKE'%a%';
d.select count(*) from user where user_gender ='F';
e.select*from user )order by user_name asc;
f.select & from detail_transaction where product_id = 3 LIMIT 5;

3. update 
a. update product set product_name = 'Dummy Product' where product_id = 1;
b. update detail_transaction set qty = 3 where product_id = 1;

4. delete 
a. delete from product where product_id = 1;
b. delete from product where product_type_id = 1; 


2:join, union,Sub-query ,function

1.gabungkan data transaksi dari user id 1 dan user id 2
select*from transaction t1 inner join transaction t2 on t1.user_id = t2.user_id where t1.user_id = 1 and t2.user_id = 2;

2.tampilkan jumlah harga transaksi user id 1.
select sum(dt.qty*p.product_price) as total_price from transaction t 
inner join detail_transaction dt on t.transaction_id = dt.transaction_id
inner join product p on dt.product_id = p.product_id where t.user_id =1;

3.tampilkan total transaksi dengan jenis produk 2.
select count((*) as total_transaction from transaction t inner join  
detail_transaction dt on t.transaction_id = dt.transaction_id inner join 
product p on dt.product_id = p.product_id where p.product_type_id = 2;

4. tampilkan sama tabel field product dan field name table product type yang saling sama berhubungan.
select p.product_id, p.product_name, p.product_type_id,
pt.product_type_name from product p inner join product_type pt on p.product_type_id = pt.product_type_id;

5.tamplian semua transaksi tabel field, produk tabel nama field dan pengguna tabel nama field
select t.transaction_id, t.user_id, u.user_name, dt.product_id,p.product_name, p.product_type_id, pt.product_type_name from 
transaction t inner join user u on t.user_id = u.user_id inner join detail_transaction dt on t.transaction_id = dt.transaction_id inner join 
product p on dt.product_id = p.product_id inner join product_type pt on p.product_type_id = pt.product_type_id;

6.buat fungsi/pemicu setelah data transaksi dihapus maka detail transaksi terhapus juga dengan id transaksi id yang dimaksud.
create trigger delete_transaction_detail after delete on transaction for each row delete from detail_transaction where transaction_id = old.transaction_id;

7.buat trigger setelah data transaksi detail dihapus maka data total_qty terupdate berdasarkan qty data transaction id yang dihapus 
create trigger update_total_qty after delete on detail_transaction for each row update transaction set total_qty = total_qty - old.qty where transaction_id = old.transaction_id;

8.tampilkan data produk yang tidak pernah ada ditabel detail_transaksi dengan sub-query 
select*from product where product_id not in (select product_id from detail_transaction);


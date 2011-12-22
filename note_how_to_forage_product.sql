#format english product
UPDATE product SET cate_name ='洗涤设备' WHERE cate_name IS NULL AND product_name REGEXP 'Series';
UPDATE product SET cate_name ='洗涤设备' WHERE cate_name IN('Washer extractors','Tumble dryers');
UPDATE product SET cate_name ='辅助设备' WHERE cate_name IN('Flatwork ironers');
UPDATE product SET cate_name ='辅助设备' WHERE cate_name IS NULL;
#2. 修改cate_name以匹配product_cates， 然后根据名称修改cate_id
UPDATE omero_forage.product p JOIN omero_pro_dev.product_cates c ON p.cate_name = c.name SET cate_id = c.id;

SELECT cate_id, cate_name, COUNT(*) FROM product GROUP BY 1,2
#3.导入数据
INSERT INTO omero_pro_dev.product_items(product_cate_id, title, description, image_path)
SELECT cate_id, product_name, description, image_path FROM omero_forage.product;


#==============================================================
#
# 洗涤设备 干洗用品 水洗用品 辅助设备 家用化工 皮衣保养
#==============================================================

#1. format http://www.ganxi520.com/product.asp

update product set cate_name = '皮衣保养' where cate_name = '皮革护理';
update product set cate_name = '家用化工' where cate_name = '洗涤产品类';
update product set cate_name = '辅助设备' where cate_name = '耗材';
update product set cate_name = '水洗用品' where cate_name = '水洗设备';
update product set cate_name = '干洗用品' where cate_name = '干洗设备';
update product set cate_name = '洗涤设备' where cate_name = 'unknown';

SELECT cate_name, count(*) from product group by 1




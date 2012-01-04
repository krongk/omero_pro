##
#1. 过滤其他干洗店信息
#2. 修改cate，与news_cates中的对应起来
#3. 修改cate_id join with news_cates
#4. 导入数据

#1.
SELECT * FROM post WHERE title REGEXP '(净衣坊|上海干洗网|法国贝林|迅速变化洗衣加盟|上海阳光|梦辉|凯利福|伊尔萨|上海洁神|美国卡露丝|依丽洁|象王|上海俊雅|洁丰|恒协|莫斯科|美国GEP|美涤|洗来雅|波莱洁|尼萨福|华尔泰|正章|伊好|伊莱雅洁|福奈特|奥特·洗福莱|维纳斯|乐而美|伊耐净|美妮斯|老人头|洛克|米兰|雪丽阿姨|邦洁|福海斯|革王|碧波特|丘比特|韩国衣生缘|灰姑娘|天赐方舟|天天新|得时康|阿仕得|卡柏|七天|约瑟芬|塞维|芙蓉露|法国兰其尔|东方白鸽|西子浣纱|威特斯|英国皇家圣雪|塞维|约瑟芬|意绿王|妮莎|玛丽阿姨|衣乐|喜也乐|优尼|施柏丽|芙蓉露|施柏丽|衣美家|泰洁|朵拉|莱顿香薰|尤萨|小白兔|良家|邦纳福|绿奥|百福莱|邦乐尼|布兰奇|翔凰|科恩丝曼|琅琅|依莱特斯|温斯顿|伊斯曼|奥维斯特|凯瑞迪|格利特|普兰德|宏象|AOK奥净|汤米|大良|奥德萨|爱丽港斯|温德萨|百洁|雪芙莱|喜兰妮)';
SELECT * FROM post WHERE description REGEXP '(净衣坊|上海干洗网|法国贝林|迅速变化洗衣加盟|上海阳光|梦辉|凯利福|伊尔萨|上海洁神|美国卡露丝|依丽洁|象王|上海俊雅|洁丰|恒协|莫斯科|美国GEP|美涤|洗来雅|波莱洁|尼萨福|华尔泰|正章|伊好|伊莱雅洁|福奈特|奥特·洗福莱|维纳斯|乐而美|伊耐净|美妮斯|老人头|洛克|米兰|雪丽阿姨|邦洁|福海斯|革王|碧波特|丘比特|韩国衣生缘|灰姑娘|天赐方舟|天天新|得时康|阿仕得|卡柏|七天|约瑟芬|塞维|芙蓉露|法国兰其尔|东方白鸽|西子浣纱|威特斯|英国皇家圣雪|塞维|约瑟芬|意绿王|妮莎|玛丽阿姨|衣乐|喜也乐|优尼|施柏丽|芙蓉露|施柏丽|衣美家|泰洁|朵拉|莱顿香薰|尤萨|小白兔|良家|邦纳福|绿奥|百福莱|邦乐尼|布兰奇|翔凰|科恩丝曼|琅琅|依莱特斯|温斯顿|伊斯曼|奥维斯特|凯瑞迪|格利特|普兰德|宏象|AOK奥净|汤米|大良|奥德萨|爱丽港斯|温德萨|百洁|雪芙莱|喜兰妮)';

DELETE FROM post WHERE  title REGEXP '(上海干洗网|法国贝林|迅速变化洗衣加盟|上海阳光|梦辉|凯利福|伊尔萨|上海洁神|美国卡露丝|依丽洁|象王|上海俊雅|洁丰|恒协|莫斯科|美国GEP|美涤|洗来雅|波莱洁|尼萨福|华尔泰|正章|伊好|伊莱雅洁|福奈特|奥特·洗福莱|维纳斯|乐而美|伊耐净|美妮斯|老人头|洛克|米兰|雪丽阿姨|邦洁|福海斯|革王|碧波特|丘比特|韩国衣生缘|灰姑娘|天赐方舟|天天新|得时康|阿仕得|卡柏|七天|约瑟芬|塞维|芙蓉露|法国兰其尔|东方白鸽|西子浣纱|威特斯|英国皇家圣雪|塞维|约瑟芬|意绿王|妮莎|玛丽阿姨|衣乐|喜也乐|优尼|施柏丽|芙蓉露|施柏丽|衣美家|泰洁|朵拉|莱顿香薰|尤萨|小白兔|良家|邦纳福|绿奥|百福莱|邦乐尼|布兰奇|翔凰|科恩丝曼|琅琅|依莱特斯|温斯顿|伊斯曼|奥维斯特|凯瑞迪|格利特|普兰德|宏象|AOK奥净|汤米|大良|奥德萨|爱丽港斯|温德萨|百洁|雪芙莱|喜兰妮)';

#2.过滤信息,设置cate
SELECT * FROM omero_forage.post WHERE cate = '洗涤知识' AND title REGEXP '赔|爆炸|失火|冒充|追偿|寻衣|缩水';

SELECT * FROM omero_forage.post WHERE cate = '洗涤知识' AND title REGEXP '干洗店';


UPDATE omero_forage.post SET cate = '洗衣常识' WHERE cate = '洗涤知识' AND title REGEXP '什么是|如何|[?]';
UPDATE omero_forage.post SET cate = '技术培训' WHERE cate = '洗涤知识' AND title REGEXP '注意|事项|方法|窍门|技巧|图解';
UPDATE omero_forage.post SET cate = '产品中心' WHERE cate = '洗涤知识' AND title REGEXP '干洗机|干洗溶剂|冷洗精|蒸汽熨斗';
UPDATE omero_forage.post SET cate = '关于欧美龙' WHERE cate = '企业动态';
UPDATE omero_forage.post SET cate = '保障体系' WHERE cate = '运营指导';
UPDATE omero_forage.post SET cate = '运营指导' WHERE cate = '行业动态';
UPDATE omero_forage.post SET cate = '洗衣常识' WHERE cate = '洗涤知识';
UPDATE omero_forage.post SET cate = '行业分析' WHERE cate = '洗涤知识' AND title REGEXP '干洗店';
UPDATE omero_forage.post SET cate = '负面新闻' WHERE title REGEXP '赔|爆炸|失火|冒充|追偿|寻衣|缩水';

#3.设置cate_id
UPDATE post JOIN omero_pro_dev.news_cates d ON d.name = post.cate SET cate_id = d.id;

#4.导入数据
INSERT INTO omero_pro_dev.news_items(news_cate_id, title, body, external_path) 
SELECT cate_id, title, description, url FROM omero_forage.post WHERE cate_id IS NOT NULL;

#==============================================================
# 新闻分类：
# 关于欧美龙  干洗新闻  洗衣常识  干洗知识  最新活动  产品中心  售后服务  保障体系  资料下载  技术培训  问题解答  加盟政策  行业分析  
#==============================================================

-- 1. 格式化净衣坊网站新闻：http://www.ganxi520.com/news.asp

SELECT cate, count(*) from post group by 1;
SELECT cate, count(*) from post where cate_id is null group by 1;

SELECT cate, count(*) from post where description REGEXP '上海' group by 1



SELECT * from post where cate = '洗涤知识';

SELECT * from post where description REGEXP '上海';

delete from post where cate in('加盟中心','干洗投资规模','文章信息','最新加盟商', '水洗投资规模', '耗材价格', '负面新闻')
update post set title = replace(title, '净衣坊', '欧美龙');
update post set description = replace(description, '净衣坊', '欧美龙');
DELETE from post where id in(31)
UPDATE omero_forage.post SET cate = '未知' WHERE title REGEXP '上海'  or description REGEXP '上海' ;


package edu.shopsys.lucene;

import java.nio.file.FileSystems;
import java.util.ArrayList;
import java.util.List;

import org.apache.lucene.analysis.Analyzer;
import org.apache.lucene.analysis.standard.StandardAnalyzer;
import org.apache.lucene.document.Document;
import org.apache.lucene.document.Field;
import org.apache.lucene.document.TextField;
import org.apache.lucene.index.IndexWriter;
import org.apache.lucene.index.IndexWriterConfig;
import org.apache.lucene.store.Directory;
import org.apache.lucene.store.FSDirectory;

import edu.shopsys.DAO.UserDAO;
import edu.shopsys.DAO.Impl.UserDAOImpl;
import edu.shopsys.model.Goods;

public class IndexManager {
    public void createIndex() throws Exception {
        // 采集数据
        UserDAO dao = new UserDAOImpl();
        List<Goods> list = dao.queryAll();
 
        // 将采集到的数据封装到Document对象中
        List<Document> docList = new ArrayList<Document>();
        Document document;
        for (Goods good : list) {
            document = new Document();
            // store:如果是yes，则说明存储到文档域中
            // Field id = new TextField("id", book.getId().toString(), Store.YES);
            Field goods_id = new TextField("goods_id", good.getGoods_id(),Field.Store.YES);
            Field goods_name = new TextField("goods_name", good.getGoods_name(),Field.Store.YES);
            Field goods_type = new TextField("goods_type", good.getGoods_type(), Field.Store.YES);
            Field goods_image = new TextField("goods_image", good.getGoods_image(), Field.Store.YES);
            Field goods_price = new TextField("goods_price", Double.toString(good.getGoods_price()), Field.Store.YES);
            Field goods_info = new TextField("goods_info", good.getGoods_type(), Field.Store.YES);
            Field goods_stock = new TextField("goods_stock", Integer.toString(good.getGoods_stock()), Field.Store.YES);
            Field goods_brand = new TextField("goods_brand", good.getGoods_brand(), Field.Store.YES);
 
            // 将field域设置到Document对象中
            document.add(goods_id);
            document.add(goods_name);
            document.add(goods_type);
            document.add(goods_image);
            document.add(goods_price);
            document.add(goods_info);
            document.add(goods_stock);
            document.add(goods_brand);
 
            docList.add(document);
        }
        //JDK 1.7以后 open只能接收Path/////////////////////////////////////////////////////
 
        // 创建分词器，标准分词器
        Analyzer analyzer = new StandardAnalyzer();
 
        // 创建IndexWriter
        // IndexWriterConfig cfg = new IndexWriterConfig(Version.LUCENE_6_5_0,analyzer);
        IndexWriterConfig cfg = new IndexWriterConfig(analyzer);
 
        // 指定索引库的地址
//         File indexFile = new File("D:\\L\a\Eclipse\\lecencedemo\\");
//         Directory directory = FSDirectory.open(indexFile);
        Directory directory = FSDirectory.open(FileSystems.getDefault().getPath("/src/luceneResource"));
 
        IndexWriter writer = new IndexWriter(directory, cfg);
        writer.deleteAll(); //清除以前的index
        // 通过IndexWriter对象将Document写入到索引库中
        for (Document doc : docList) {
            writer.addDocument(doc);
        }
 
        // 关闭writer
        writer.close();
    }
 
}

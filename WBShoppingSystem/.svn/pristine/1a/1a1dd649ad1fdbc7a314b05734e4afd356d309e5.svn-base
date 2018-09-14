package edu.shopsys.lucene;

import org.apache.lucene.analysis.Analyzer;
import org.apache.lucene.analysis.standard.StandardAnalyzer;
import org.apache.lucene.document.*;
import org.apache.lucene.index.*;
import org.apache.lucene.queryparser.classic.ParseException;
import org.apache.lucene.queryparser.classic.QueryParser;
import org.apache.lucene.search.IndexSearcher;
import org.apache.lucene.search.Query;
import org.apache.lucene.search.ScoreDoc;
import org.apache.lucene.search.TopDocs;
import org.apache.lucene.store.Directory;
import org.apache.lucene.store.FSDirectory;
 
import java.io.File;
import java.io.IOException;
import java.nio.file.Path;
 
/**
 * 参考文件：http://lucene.apache.org/core/6_5_0/core/overview-summary.html#overview.description
 * <p>
 * Created by Administrator on 2017/4/26.
 */
public class TestLucene {
    // 创建索引

    public void createIndex() throws IOException {
        //分词器  (对文本进行分词...)
        Analyzer analyzer = new StandardAnalyzer();
        File file = new File("temp/");
        Path path = file.toPath();
        Directory directory = FSDirectory.open(path);
 
        IndexWriterConfig indexWriterConfig = new IndexWriterConfig(analyzer);
//构建用于操作索引的类
        IndexWriter indexWriter = new IndexWriter(directory, indexWriterConfig);
        Document document = new Document();
        IndexableField filed = new TextField("id", Integer.toString(1), Field.Store.YES);
        IndexableField title = new StringField("title", "Lucene_百度百科", Field.Store.YES);
        IndexableField content = new TextField("content", "Lucene是apache软件基金会4 jakarta项目组的一个子项目，是一个开放源代码的全文检索引擎工具包，但它不是一个完整的全文检索引擎，而是一个全文检索引擎的架构，提供了完整的...", Field.Store.YES);
 
        document.add(filed);
        document.add(title);
        document.add(content);
        indexWriter.addDocument(document);
        indexWriter.close();
    }
 

    public void searchIndex() throws IOException, ParseException {
 
        Analyzer analyzer = new StandardAnalyzer();
 
        File file = new File("E:\\index.txt");
        Path path = file.toPath();
        //索引存放的位置....
        Directory directory = FSDirectory.open(path);
        IndexReader indexReader = DirectoryReader.open(directory);
        //通过indexSearcher 去检索索引目录...
        IndexSearcher indexSearcher = new IndexSearcher(indexReader);
        //这个是一个搜索条件..，通过定义条件来进行查找
        QueryParser parser = new QueryParser("content", analyzer);
        Query query = parser.parse("apache");
        //搜索先搜索索引目录..
        //找到符合query 条件的前面N条记录...
        TopDocs topDocs = indexSearcher.search(query, 100);
        System.out.println("总记录数是====：" + topDocs.totalHits);
        ScoreDoc[] scoreDocs = topDocs.scoreDocs;
        //返回一个击中
        for (ScoreDoc scoreDoc : scoreDocs) {
            int docId = scoreDoc.doc;
            Document document = indexSearcher.doc(docId);
            System.out.println(document.get("id"));
            System.out.println(document.get("title"));
            System.out.println(document.get("content"));
        }
 
    }
    public static void main(String[] args) {
		TestLucene lucene = new TestLucene();
		try {
			lucene.searchIndex();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
    
}

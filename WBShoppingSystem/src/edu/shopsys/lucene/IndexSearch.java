package edu.shopsys.lucene;

import java.io.IOException;

import java.nio.file.FileSystems;
import java.util.ArrayList;
import java.util.List;

import org.apache.lucene.analysis.Analyzer;
import org.apache.lucene.analysis.standard.StandardAnalyzer;
import org.apache.lucene.document.Document;
import org.apache.lucene.index.DirectoryReader;
import org.apache.lucene.index.IndexReader;
import org.apache.lucene.queryparser.classic.QueryParser;
import org.apache.lucene.search.IndexSearcher;
import org.apache.lucene.search.Query;
import org.apache.lucene.search.ScoreDoc;
import org.apache.lucene.search.TopDocs;
import org.apache.lucene.store.Directory;
import org.apache.lucene.store.FSDirectory;

import edu.shopsys.model.Goods;

public class IndexSearch {
	private List<Goods> doSearch(Query query) {
		// 创建IndexSearcher
		// 指定索引库的地址
		List<Goods> list = null;
		try {
			// File indexFile = new File("D:\\Lpj\\Eclipse\\lecencedemo\\");
			// Directory directory = FSDirectory.open(indexFile);
			// 1、创建Directory
			// JDK 1.7以后 open只能接收Path
			Directory directory = FSDirectory.open(FileSystems.getDefault().getPath("/src/luceneResource"));
			IndexReader reader = DirectoryReader.open(directory);
			IndexSearcher searcher = new IndexSearcher(reader);
			// 通过searcher来搜索索引库
			// 第二个参数：指定需要显示的顶部记录的N条
			TopDocs topDocs = searcher.search(query, 10);

			// 根据查询条件匹配出的记录总数
			int count = topDocs.totalHits;
			System.out.println("匹配出的记录总数:" + count);
			// 根据查询条件匹配出的记录
			ScoreDoc[] scoreDocs = topDocs.scoreDocs;
			list = new ArrayList<Goods>();
			for (ScoreDoc scoreDoc : scoreDocs) {
				Goods goods = new Goods();
				// 获取文档的ID
				int docId = scoreDoc.doc;
				// 通过ID获取文档
				Document doc = searcher.doc(docId);
				goods.setGoods_id(doc.get("goods_id"));
				goods.setGoods_name(doc.get("goods_name"));
				goods.setGoods_type(doc.get("goods_type"));
				goods.setGoods_image(doc.get("goods_image"));
				goods.setGoods_price(Double.parseDouble(doc.get("goods_price")));
				goods.setGoods_info(doc.get("goods_info"));
				goods.setGoods_stock(Integer.parseInt(doc.get("goods_stock")));
				goods.setGoods_brand(doc.get("goods_brand"));
				list.add(goods);
				// System.out.println("商品描述：" + doc.get("description"));
			}
			// 关闭资源
			reader.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return list;
	}

	public List<Goods> indexSearch(String keyword) throws Exception {
		// 创建query对象
		Analyzer analyzer = new StandardAnalyzer();
		// 使用QueryParser搜索时，需要指定分词器，搜索时的分词器要和索引时的分词器一致
		// 第一个参数：默认搜索的域的名称
		QueryParser parser = new QueryParser("goods_brand", analyzer);

		// 通过queryparser来创建query对象
		// 参数：输入的lucene的查询语句(关键字一定要大写)
		Query query = parser.parse("goods_brand:" + keyword 
				+ "OR goods_name:" + keyword 
				+ "OR goods_type:" + keyword
				+ "OR goods_info:" + keyword);
		return doSearch(query);

	}

	public static void main(String[] args) {
		IndexSearch search = new IndexSearch();
		// IndexManager manager = new IndexManager();
		try {
			// manager.createIndex();
			System.out.println(search.indexSearch("凡客"));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}

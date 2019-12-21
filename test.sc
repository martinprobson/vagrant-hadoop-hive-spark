
import org.apache.spark.sql.DataFrame
import spark.implicits._

def genDataFrame: DataFrame = {
  val rnd = new scala.util.Random
  val l = List.fill(10)(rnd.nextInt(10000))
  spark.sparkContext.parallelize(l).toDF()
}

println("Start")
val e: Seq[Int] = Seq()
val empty = spark.sqlContext.createDataset(e).toDF()
val l = Range(1,2000).toList.map{ _ => genDataFrame}.reduce(_.union(_))
println(l.count)
println("End")



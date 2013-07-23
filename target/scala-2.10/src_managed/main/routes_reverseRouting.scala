// @SOURCE:C:/Users/acarey/Desktop/andrewregressionsite/regressionsite/conf/routes
// @HASH:ea6384fd908d1dfcbcdafd21dd02bdeea1f59298
// @DATE:Tue Jul 23 11:39:57 EDT 2013

import Routes.{prefix => _prefix, defaultPrefix => _defaultPrefix}
import play.core._
import play.core.Router._
import play.core.j._
import java.net.URLEncoder

import play.api.mvc._
import play.libs.F

import Router.queryString


// @LINE:47
// @LINE:43
// @LINE:42
// @LINE:41
// @LINE:38
// @LINE:35
// @LINE:34
// @LINE:31
// @LINE:30
// @LINE:29
// @LINE:28
// @LINE:25
// @LINE:21
// @LINE:20
// @LINE:19
// @LINE:18
// @LINE:17
// @LINE:16
// @LINE:15
// @LINE:14
// @LINE:13
// @LINE:9
// @LINE:6
package controllers {

// @LINE:29
class ReverseAddToDB {
    

// @LINE:29
def saveRun(): Call = {
   Call("POST", _prefix + { _defaultPrefix } + "importrun")
}
                                                
    
}
                          

// @LINE:41
// @LINE:31
// @LINE:30
class ReverseNewRun {
    

// @LINE:41
def downloadBatch(): Call = {
   Call("POST", _prefix + { _defaultPrefix } + "download")
}
                                                

// @LINE:30
def newRun(): Call = {
   Call("GET", _prefix + { _defaultPrefix } + "newrun")
}
                                                

// @LINE:31
def addNewRun(): Call = {
   Call("POST", _prefix + { _defaultPrefix } + "newrun")
}
                                                
    
}
                          

// @LINE:43
// @LINE:42
// @LINE:38
// @LINE:35
// @LINE:34
// @LINE:28
// @LINE:25
// @LINE:21
// @LINE:20
// @LINE:19
// @LINE:18
// @LINE:17
// @LINE:16
// @LINE:15
// @LINE:14
// @LINE:13
// @LINE:9
// @LINE:6
class ReverseApplication {
    

// @LINE:42
def createFile(filter1:String, filter2:String, param1:String, param2:String): Call = {
   Call("GET", _prefix + { _defaultPrefix } + "getExcel/" + implicitly[PathBindable[String]].unbind("filter1", URLEncoder.encode(filter1, "utf-8")) + "/" + implicitly[PathBindable[String]].unbind("filter2", URLEncoder.encode(filter2, "utf-8")) + "/" + implicitly[PathBindable[String]].unbind("param1", URLEncoder.encode(param1, "utf-8")) + "/" + implicitly[PathBindable[String]].unbind("param2", URLEncoder.encode(param2, "utf-8")))
}
                                                

// @LINE:25
def listPageByRun(p:Int = 0, s:String = "name", o:String = "asc", id:Long, f:String = "", d:String): Call = {
   Call("GET", _prefix + { _defaultPrefix } + "pagesbyrun/" + implicitly[PathBindable[Long]].unbind("id", id) + "/" + implicitly[PathBindable[String]].unbind("d", URLEncoder.encode(d, "utf-8")) + queryString(List(if(p == 0) None else Some(implicitly[QueryStringBindable[Int]].unbind("p", p)), if(s == "name") None else Some(implicitly[QueryStringBindable[String]].unbind("s", s)), if(o == "asc") None else Some(implicitly[QueryStringBindable[String]].unbind("o", o)), if(f == "") None else Some(implicitly[QueryStringBindable[String]].unbind("f", f)))))
}
                                                

// @LINE:16
def listBug(p:Int = 0, s:String = "number", o:String = "asc", f:String = ""): Call = {
   Call("GET", _prefix + { _defaultPrefix } + "bugs" + queryString(List(if(p == 0) None else Some(implicitly[QueryStringBindable[Int]].unbind("p", p)), if(s == "number") None else Some(implicitly[QueryStringBindable[String]].unbind("s", s)), if(o == "asc") None else Some(implicitly[QueryStringBindable[String]].unbind("o", o)), if(f == "") None else Some(implicitly[QueryStringBindable[String]].unbind("f", f)))))
}
                                                

// @LINE:21
def recentRuns(filter1:String, filter2:String, param1:String, param2:String, days:Int): Call = {
   Call("GET", _prefix + { _defaultPrefix } + "recentRuns/" + implicitly[PathBindable[String]].unbind("filter1", URLEncoder.encode(filter1, "utf-8")) + "/" + implicitly[PathBindable[String]].unbind("filter2", URLEncoder.encode(filter2, "utf-8")) + "/" + implicitly[PathBindable[String]].unbind("param1", URLEncoder.encode(param1, "utf-8")) + "/" + implicitly[PathBindable[String]].unbind("param2", URLEncoder.encode(param2, "utf-8")) + "/" + implicitly[PathBindable[Int]].unbind("days", days))
}
                                                

// @LINE:43
def pageExcel(runID:Long): Call = {
   Call("GET", _prefix + { _defaultPrefix } + "pageExcel/" + implicitly[PathBindable[Long]].unbind("runID", runID))
}
                                                

// @LINE:9
def javascriptRoutes(): Call = {
   Call("GET", _prefix + { _defaultPrefix } + "assets/javascripts/routes")
}
                                                

// @LINE:28
def importRun(): Call = {
   Call("GET", _prefix + { _defaultPrefix } + "importrun")
}
                                                

// @LINE:13
def runIndex(): Call = {
   Call("GET", _prefix + { _defaultPrefix } + "runs")
}
                                                

// @LINE:38
def deleteRun(runID:Long): Call = {
   Call("GET", _prefix + { _defaultPrefix } + "runs/delete/" + implicitly[PathBindable[Long]].unbind("runID", runID))
}
                                                

// @LINE:35
def addDiffDesc(): Call = {
   Call("POST", _prefix + { _defaultPrefix } + "saveDiffDesc")
}
                                                

// @LINE:15
def listPage(p:Int = 0, s:String = "name", o:String = "asc", f:String = ""): Call = {
   Call("GET", _prefix + { _defaultPrefix } + "pages" + queryString(List(if(p == 0) None else Some(implicitly[QueryStringBindable[Int]].unbind("p", p)), if(s == "name") None else Some(implicitly[QueryStringBindable[String]].unbind("s", s)), if(o == "asc") None else Some(implicitly[QueryStringBindable[String]].unbind("o", o)), if(f == "") None else Some(implicitly[QueryStringBindable[String]].unbind("f", f)))))
}
                                                

// @LINE:19
def dataList(filter1:String, filter2:String, param1:String, param2:String): Call = {
   Call("GET", _prefix + { _defaultPrefix } + "dataList/" + implicitly[PathBindable[String]].unbind("filter1", URLEncoder.encode(filter1, "utf-8")) + "/" + implicitly[PathBindable[String]].unbind("filter2", URLEncoder.encode(filter2, "utf-8")) + "/" + implicitly[PathBindable[String]].unbind("param1", URLEncoder.encode(param1, "utf-8")) + "/" + implicitly[PathBindable[String]].unbind("param2", URLEncoder.encode(param2, "utf-8")))
}
                                                

// @LINE:34
def addBugNum(): Call = {
   Call("POST", _prefix + { _defaultPrefix } + "saveBugNum")
}
                                                

// @LINE:17
def overview(): Call = {
   Call("GET", _prefix + { _defaultPrefix } + "overview")
}
                                                

// @LINE:18
def getData(id:Long): Call = {
   Call("GET", _prefix + { _defaultPrefix } + "runData/" + implicitly[PathBindable[Long]].unbind("id", id))
}
                                                

// @LINE:6
def index(): Call = {
   Call("GET", _prefix)
}
                                                

// @LINE:20
def bugData(id:Long): Call = {
   Call("GET", _prefix + { _defaultPrefix } + "bugData/" + implicitly[PathBindable[Long]].unbind("id", id))
}
                                                

// @LINE:14
def listRun(p:Int = 0, s:String = "name", o:String = "asc", f:String = "", filterBy:String): Call = {
   Call("GET", _prefix + { _defaultPrefix } + "runs/" + implicitly[PathBindable[String]].unbind("filterBy", URLEncoder.encode(filterBy, "utf-8")) + queryString(List(if(p == 0) None else Some(implicitly[QueryStringBindable[Int]].unbind("p", p)), if(s == "name") None else Some(implicitly[QueryStringBindable[String]].unbind("s", s)), if(o == "asc") None else Some(implicitly[QueryStringBindable[String]].unbind("o", o)), if(f == "") None else Some(implicitly[QueryStringBindable[String]].unbind("f", f)))))
}
                                                
    
}
                          

// @LINE:47
class ReverseAssets {
    

// @LINE:47
def at(file:String): Call = {
   Call("GET", _prefix + { _defaultPrefix } + "assets/" + implicitly[PathBindable[String]].unbind("file", file))
}
                                                
    
}
                          
}
                  


// @LINE:47
// @LINE:43
// @LINE:42
// @LINE:41
// @LINE:38
// @LINE:35
// @LINE:34
// @LINE:31
// @LINE:30
// @LINE:29
// @LINE:28
// @LINE:25
// @LINE:21
// @LINE:20
// @LINE:19
// @LINE:18
// @LINE:17
// @LINE:16
// @LINE:15
// @LINE:14
// @LINE:13
// @LINE:9
// @LINE:6
package controllers.javascript {

// @LINE:29
class ReverseAddToDB {
    

// @LINE:29
def saveRun : JavascriptReverseRoute = JavascriptReverseRoute(
   "controllers.AddToDB.saveRun",
   """
      function() {
      return _wA({method:"POST", url:"""" + _prefix + { _defaultPrefix } + """" + "importrun"})
      }
   """
)
                        
    
}
              

// @LINE:41
// @LINE:31
// @LINE:30
class ReverseNewRun {
    

// @LINE:41
def downloadBatch : JavascriptReverseRoute = JavascriptReverseRoute(
   "controllers.NewRun.downloadBatch",
   """
      function() {
      return _wA({method:"POST", url:"""" + _prefix + { _defaultPrefix } + """" + "download"})
      }
   """
)
                        

// @LINE:30
def newRun : JavascriptReverseRoute = JavascriptReverseRoute(
   "controllers.NewRun.newRun",
   """
      function() {
      return _wA({method:"GET", url:"""" + _prefix + { _defaultPrefix } + """" + "newrun"})
      }
   """
)
                        

// @LINE:31
def addNewRun : JavascriptReverseRoute = JavascriptReverseRoute(
   "controllers.NewRun.addNewRun",
   """
      function() {
      return _wA({method:"POST", url:"""" + _prefix + { _defaultPrefix } + """" + "newrun"})
      }
   """
)
                        
    
}
              

// @LINE:43
// @LINE:42
// @LINE:38
// @LINE:35
// @LINE:34
// @LINE:28
// @LINE:25
// @LINE:21
// @LINE:20
// @LINE:19
// @LINE:18
// @LINE:17
// @LINE:16
// @LINE:15
// @LINE:14
// @LINE:13
// @LINE:9
// @LINE:6
class ReverseApplication {
    

// @LINE:42
def createFile : JavascriptReverseRoute = JavascriptReverseRoute(
   "controllers.Application.createFile",
   """
      function(filter1,filter2,param1,param2) {
      return _wA({method:"GET", url:"""" + _prefix + { _defaultPrefix } + """" + "getExcel/" + (""" + implicitly[PathBindable[String]].javascriptUnbind + """)("filter1", encodeURIComponent(filter1)) + "/" + (""" + implicitly[PathBindable[String]].javascriptUnbind + """)("filter2", encodeURIComponent(filter2)) + "/" + (""" + implicitly[PathBindable[String]].javascriptUnbind + """)("param1", encodeURIComponent(param1)) + "/" + (""" + implicitly[PathBindable[String]].javascriptUnbind + """)("param2", encodeURIComponent(param2))})
      }
   """
)
                        

// @LINE:25
def listPageByRun : JavascriptReverseRoute = JavascriptReverseRoute(
   "controllers.Application.listPageByRun",
   """
      function(p,s,o,id,f,d) {
      return _wA({method:"GET", url:"""" + _prefix + { _defaultPrefix } + """" + "pagesbyrun/" + (""" + implicitly[PathBindable[Long]].javascriptUnbind + """)("id", id) + "/" + (""" + implicitly[PathBindable[String]].javascriptUnbind + """)("d", encodeURIComponent(d)) + _qS([(p == null ? null : (""" + implicitly[QueryStringBindable[Int]].javascriptUnbind + """)("p", p)), (s == null ? null : (""" + implicitly[QueryStringBindable[String]].javascriptUnbind + """)("s", s)), (o == null ? null : (""" + implicitly[QueryStringBindable[String]].javascriptUnbind + """)("o", o)), (f == null ? null : (""" + implicitly[QueryStringBindable[String]].javascriptUnbind + """)("f", f))])})
      }
   """
)
                        

// @LINE:16
def listBug : JavascriptReverseRoute = JavascriptReverseRoute(
   "controllers.Application.listBug",
   """
      function(p,s,o,f) {
      return _wA({method:"GET", url:"""" + _prefix + { _defaultPrefix } + """" + "bugs" + _qS([(p == null ? null : (""" + implicitly[QueryStringBindable[Int]].javascriptUnbind + """)("p", p)), (s == null ? null : (""" + implicitly[QueryStringBindable[String]].javascriptUnbind + """)("s", s)), (o == null ? null : (""" + implicitly[QueryStringBindable[String]].javascriptUnbind + """)("o", o)), (f == null ? null : (""" + implicitly[QueryStringBindable[String]].javascriptUnbind + """)("f", f))])})
      }
   """
)
                        

// @LINE:21
def recentRuns : JavascriptReverseRoute = JavascriptReverseRoute(
   "controllers.Application.recentRuns",
   """
      function(filter1,filter2,param1,param2,days) {
      return _wA({method:"GET", url:"""" + _prefix + { _defaultPrefix } + """" + "recentRuns/" + (""" + implicitly[PathBindable[String]].javascriptUnbind + """)("filter1", encodeURIComponent(filter1)) + "/" + (""" + implicitly[PathBindable[String]].javascriptUnbind + """)("filter2", encodeURIComponent(filter2)) + "/" + (""" + implicitly[PathBindable[String]].javascriptUnbind + """)("param1", encodeURIComponent(param1)) + "/" + (""" + implicitly[PathBindable[String]].javascriptUnbind + """)("param2", encodeURIComponent(param2)) + "/" + (""" + implicitly[PathBindable[Int]].javascriptUnbind + """)("days", days)})
      }
   """
)
                        

// @LINE:43
def pageExcel : JavascriptReverseRoute = JavascriptReverseRoute(
   "controllers.Application.pageExcel",
   """
      function(runID) {
      return _wA({method:"GET", url:"""" + _prefix + { _defaultPrefix } + """" + "pageExcel/" + (""" + implicitly[PathBindable[Long]].javascriptUnbind + """)("runID", runID)})
      }
   """
)
                        

// @LINE:9
def javascriptRoutes : JavascriptReverseRoute = JavascriptReverseRoute(
   "controllers.Application.javascriptRoutes",
   """
      function() {
      return _wA({method:"GET", url:"""" + _prefix + { _defaultPrefix } + """" + "assets/javascripts/routes"})
      }
   """
)
                        

// @LINE:28
def importRun : JavascriptReverseRoute = JavascriptReverseRoute(
   "controllers.Application.importRun",
   """
      function() {
      return _wA({method:"GET", url:"""" + _prefix + { _defaultPrefix } + """" + "importrun"})
      }
   """
)
                        

// @LINE:13
def runIndex : JavascriptReverseRoute = JavascriptReverseRoute(
   "controllers.Application.runIndex",
   """
      function() {
      return _wA({method:"GET", url:"""" + _prefix + { _defaultPrefix } + """" + "runs"})
      }
   """
)
                        

// @LINE:38
def deleteRun : JavascriptReverseRoute = JavascriptReverseRoute(
   "controllers.Application.deleteRun",
   """
      function(runID) {
      return _wA({method:"GET", url:"""" + _prefix + { _defaultPrefix } + """" + "runs/delete/" + (""" + implicitly[PathBindable[Long]].javascriptUnbind + """)("runID", runID)})
      }
   """
)
                        

// @LINE:35
def addDiffDesc : JavascriptReverseRoute = JavascriptReverseRoute(
   "controllers.Application.addDiffDesc",
   """
      function() {
      return _wA({method:"POST", url:"""" + _prefix + { _defaultPrefix } + """" + "saveDiffDesc"})
      }
   """
)
                        

// @LINE:15
def listPage : JavascriptReverseRoute = JavascriptReverseRoute(
   "controllers.Application.listPage",
   """
      function(p,s,o,f) {
      return _wA({method:"GET", url:"""" + _prefix + { _defaultPrefix } + """" + "pages" + _qS([(p == null ? null : (""" + implicitly[QueryStringBindable[Int]].javascriptUnbind + """)("p", p)), (s == null ? null : (""" + implicitly[QueryStringBindable[String]].javascriptUnbind + """)("s", s)), (o == null ? null : (""" + implicitly[QueryStringBindable[String]].javascriptUnbind + """)("o", o)), (f == null ? null : (""" + implicitly[QueryStringBindable[String]].javascriptUnbind + """)("f", f))])})
      }
   """
)
                        

// @LINE:19
def dataList : JavascriptReverseRoute = JavascriptReverseRoute(
   "controllers.Application.dataList",
   """
      function(filter1,filter2,param1,param2) {
      return _wA({method:"GET", url:"""" + _prefix + { _defaultPrefix } + """" + "dataList/" + (""" + implicitly[PathBindable[String]].javascriptUnbind + """)("filter1", encodeURIComponent(filter1)) + "/" + (""" + implicitly[PathBindable[String]].javascriptUnbind + """)("filter2", encodeURIComponent(filter2)) + "/" + (""" + implicitly[PathBindable[String]].javascriptUnbind + """)("param1", encodeURIComponent(param1)) + "/" + (""" + implicitly[PathBindable[String]].javascriptUnbind + """)("param2", encodeURIComponent(param2))})
      }
   """
)
                        

// @LINE:34
def addBugNum : JavascriptReverseRoute = JavascriptReverseRoute(
   "controllers.Application.addBugNum",
   """
      function() {
      return _wA({method:"POST", url:"""" + _prefix + { _defaultPrefix } + """" + "saveBugNum"})
      }
   """
)
                        

// @LINE:17
def overview : JavascriptReverseRoute = JavascriptReverseRoute(
   "controllers.Application.overview",
   """
      function() {
      return _wA({method:"GET", url:"""" + _prefix + { _defaultPrefix } + """" + "overview"})
      }
   """
)
                        

// @LINE:18
def getData : JavascriptReverseRoute = JavascriptReverseRoute(
   "controllers.Application.getData",
   """
      function(id) {
      return _wA({method:"GET", url:"""" + _prefix + { _defaultPrefix } + """" + "runData/" + (""" + implicitly[PathBindable[Long]].javascriptUnbind + """)("id", id)})
      }
   """
)
                        

// @LINE:6
def index : JavascriptReverseRoute = JavascriptReverseRoute(
   "controllers.Application.index",
   """
      function() {
      return _wA({method:"GET", url:"""" + _prefix + """"})
      }
   """
)
                        

// @LINE:20
def bugData : JavascriptReverseRoute = JavascriptReverseRoute(
   "controllers.Application.bugData",
   """
      function(id) {
      return _wA({method:"GET", url:"""" + _prefix + { _defaultPrefix } + """" + "bugData/" + (""" + implicitly[PathBindable[Long]].javascriptUnbind + """)("id", id)})
      }
   """
)
                        

// @LINE:14
def listRun : JavascriptReverseRoute = JavascriptReverseRoute(
   "controllers.Application.listRun",
   """
      function(p,s,o,f,filterBy) {
      return _wA({method:"GET", url:"""" + _prefix + { _defaultPrefix } + """" + "runs/" + (""" + implicitly[PathBindable[String]].javascriptUnbind + """)("filterBy", encodeURIComponent(filterBy)) + _qS([(p == null ? null : (""" + implicitly[QueryStringBindable[Int]].javascriptUnbind + """)("p", p)), (s == null ? null : (""" + implicitly[QueryStringBindable[String]].javascriptUnbind + """)("s", s)), (o == null ? null : (""" + implicitly[QueryStringBindable[String]].javascriptUnbind + """)("o", o)), (f == null ? null : (""" + implicitly[QueryStringBindable[String]].javascriptUnbind + """)("f", f))])})
      }
   """
)
                        
    
}
              

// @LINE:47
class ReverseAssets {
    

// @LINE:47
def at : JavascriptReverseRoute = JavascriptReverseRoute(
   "controllers.Assets.at",
   """
      function(file) {
      return _wA({method:"GET", url:"""" + _prefix + { _defaultPrefix } + """" + "assets/" + (""" + implicitly[PathBindable[String]].javascriptUnbind + """)("file", file)})
      }
   """
)
                        
    
}
              
}
        


// @LINE:47
// @LINE:43
// @LINE:42
// @LINE:41
// @LINE:38
// @LINE:35
// @LINE:34
// @LINE:31
// @LINE:30
// @LINE:29
// @LINE:28
// @LINE:25
// @LINE:21
// @LINE:20
// @LINE:19
// @LINE:18
// @LINE:17
// @LINE:16
// @LINE:15
// @LINE:14
// @LINE:13
// @LINE:9
// @LINE:6
package controllers.ref {

// @LINE:29
class ReverseAddToDB {
    

// @LINE:29
def saveRun(): play.api.mvc.HandlerRef[_] = new play.api.mvc.HandlerRef(
   controllers.AddToDB.saveRun(), HandlerDef(this, "controllers.AddToDB", "saveRun", Seq(), "POST", """""", _prefix + """importrun""")
)
                      
    
}
                          

// @LINE:41
// @LINE:31
// @LINE:30
class ReverseNewRun {
    

// @LINE:41
def downloadBatch(): play.api.mvc.HandlerRef[_] = new play.api.mvc.HandlerRef(
   controllers.NewRun.downloadBatch(), HandlerDef(this, "controllers.NewRun", "downloadBatch", Seq(), "POST", """ Download""", _prefix + """download""")
)
                      

// @LINE:30
def newRun(): play.api.mvc.HandlerRef[_] = new play.api.mvc.HandlerRef(
   controllers.NewRun.newRun(), HandlerDef(this, "controllers.NewRun", "newRun", Seq(), "GET", """""", _prefix + """newrun""")
)
                      

// @LINE:31
def addNewRun(): play.api.mvc.HandlerRef[_] = new play.api.mvc.HandlerRef(
   controllers.NewRun.addNewRun(), HandlerDef(this, "controllers.NewRun", "addNewRun", Seq(), "POST", """""", _prefix + """newrun""")
)
                      
    
}
                          

// @LINE:43
// @LINE:42
// @LINE:38
// @LINE:35
// @LINE:34
// @LINE:28
// @LINE:25
// @LINE:21
// @LINE:20
// @LINE:19
// @LINE:18
// @LINE:17
// @LINE:16
// @LINE:15
// @LINE:14
// @LINE:13
// @LINE:9
// @LINE:6
class ReverseApplication {
    

// @LINE:42
def createFile(filter1:String, filter2:String, param1:String, param2:String): play.api.mvc.HandlerRef[_] = new play.api.mvc.HandlerRef(
   controllers.Application.createFile(filter1, filter2, param1, param2), HandlerDef(this, "controllers.Application", "createFile", Seq(classOf[String], classOf[String], classOf[String], classOf[String]), "GET", """""", _prefix + """getExcel/$filter1<[^/]+>/$filter2<[^/]+>/$param1<[^/]+>/$param2<[^/]+>""")
)
                      

// @LINE:25
def listPageByRun(p:Int, s:String, o:String, id:Long, f:String, d:String): play.api.mvc.HandlerRef[_] = new play.api.mvc.HandlerRef(
   controllers.Application.listPageByRun(p, s, o, id, f, d), HandlerDef(this, "controllers.Application", "listPageByRun", Seq(classOf[Int], classOf[String], classOf[String], classOf[Long], classOf[String], classOf[String]), "GET", """ page by run""", _prefix + """pagesbyrun/$id<[^/]+>/$d<[^/]+>""")
)
                      

// @LINE:16
def listBug(p:Int, s:String, o:String, f:String): play.api.mvc.HandlerRef[_] = new play.api.mvc.HandlerRef(
   controllers.Application.listBug(p, s, o, f), HandlerDef(this, "controllers.Application", "listBug", Seq(classOf[Int], classOf[String], classOf[String], classOf[String]), "GET", """""", _prefix + """bugs""")
)
                      

// @LINE:21
def recentRuns(filter1:String, filter2:String, param1:String, param2:String, days:Int): play.api.mvc.HandlerRef[_] = new play.api.mvc.HandlerRef(
   controllers.Application.recentRuns(filter1, filter2, param1, param2, days), HandlerDef(this, "controllers.Application", "recentRuns", Seq(classOf[String], classOf[String], classOf[String], classOf[String], classOf[Int]), "GET", """""", _prefix + """recentRuns/$filter1<[^/]+>/$filter2<[^/]+>/$param1<[^/]+>/$param2<[^/]+>/$days<[^/]+>""")
)
                      

// @LINE:43
def pageExcel(runID:Long): play.api.mvc.HandlerRef[_] = new play.api.mvc.HandlerRef(
   controllers.Application.pageExcel(runID), HandlerDef(this, "controllers.Application", "pageExcel", Seq(classOf[Long]), "GET", """""", _prefix + """pageExcel/$runID<[^/]+>""")
)
                      

// @LINE:9
def javascriptRoutes(): play.api.mvc.HandlerRef[_] = new play.api.mvc.HandlerRef(
   controllers.Application.javascriptRoutes(), HandlerDef(this, "controllers.Application", "javascriptRoutes", Seq(), "GET", """ JavaScript Routes""", _prefix + """assets/javascripts/routes""")
)
                      

// @LINE:28
def importRun(): play.api.mvc.HandlerRef[_] = new play.api.mvc.HandlerRef(
   controllers.Application.importRun(), HandlerDef(this, "controllers.Application", "importRun", Seq(), "GET", """ Edit pages""", _prefix + """importrun""")
)
                      

// @LINE:13
def runIndex(): play.api.mvc.HandlerRef[_] = new play.api.mvc.HandlerRef(
   controllers.Application.runIndex(), HandlerDef(this, "controllers.Application", "runIndex", Seq(), "GET", """""", _prefix + """runs""")
)
                      

// @LINE:38
def deleteRun(runID:Long): play.api.mvc.HandlerRef[_] = new play.api.mvc.HandlerRef(
   controllers.Application.deleteRun(runID), HandlerDef(this, "controllers.Application", "deleteRun", Seq(classOf[Long]), "GET", """ Deletions""", _prefix + """runs/delete/$runID<[^/]+>""")
)
                      

// @LINE:35
def addDiffDesc(): play.api.mvc.HandlerRef[_] = new play.api.mvc.HandlerRef(
   controllers.Application.addDiffDesc(), HandlerDef(this, "controllers.Application", "addDiffDesc", Seq(), "POST", """""", _prefix + """saveDiffDesc""")
)
                      

// @LINE:15
def listPage(p:Int, s:String, o:String, f:String): play.api.mvc.HandlerRef[_] = new play.api.mvc.HandlerRef(
   controllers.Application.listPage(p, s, o, f), HandlerDef(this, "controllers.Application", "listPage", Seq(classOf[Int], classOf[String], classOf[String], classOf[String]), "GET", """""", _prefix + """pages""")
)
                      

// @LINE:19
def dataList(filter1:String, filter2:String, param1:String, param2:String): play.api.mvc.HandlerRef[_] = new play.api.mvc.HandlerRef(
   controllers.Application.dataList(filter1, filter2, param1, param2), HandlerDef(this, "controllers.Application", "dataList", Seq(classOf[String], classOf[String], classOf[String], classOf[String]), "GET", """""", _prefix + """dataList/$filter1<[^/]+>/$filter2<[^/]+>/$param1<[^/]+>/$param2<[^/]+>""")
)
                      

// @LINE:34
def addBugNum(): play.api.mvc.HandlerRef[_] = new play.api.mvc.HandlerRef(
   controllers.Application.addBugNum(), HandlerDef(this, "controllers.Application", "addBugNum", Seq(), "POST", """ Manual data entry after run submission""", _prefix + """saveBugNum""")
)
                      

// @LINE:17
def overview(): play.api.mvc.HandlerRef[_] = new play.api.mvc.HandlerRef(
   controllers.Application.overview(), HandlerDef(this, "controllers.Application", "overview", Seq(), "GET", """""", _prefix + """overview""")
)
                      

// @LINE:18
def getData(id:Long): play.api.mvc.HandlerRef[_] = new play.api.mvc.HandlerRef(
   controllers.Application.getData(id), HandlerDef(this, "controllers.Application", "getData", Seq(classOf[Long]), "GET", """""", _prefix + """runData/$id<[^/]+>""")
)
                      

// @LINE:6
def index(): play.api.mvc.HandlerRef[_] = new play.api.mvc.HandlerRef(
   controllers.Application.index(), HandlerDef(this, "controllers.Application", "index", Seq(), "GET", """ Home page""", _prefix + """""")
)
                      

// @LINE:20
def bugData(id:Long): play.api.mvc.HandlerRef[_] = new play.api.mvc.HandlerRef(
   controllers.Application.bugData(id), HandlerDef(this, "controllers.Application", "bugData", Seq(classOf[Long]), "GET", """""", _prefix + """bugData/$id<[^/]+>""")
)
                      

// @LINE:14
def listRun(p:Int, s:String, o:String, f:String, filterBy:String): play.api.mvc.HandlerRef[_] = new play.api.mvc.HandlerRef(
   controllers.Application.listRun(p, s, o, f, filterBy), HandlerDef(this, "controllers.Application", "listRun", Seq(classOf[Int], classOf[String], classOf[String], classOf[String], classOf[String]), "GET", """""", _prefix + """runs/$filterBy<[^/]+>""")
)
                      
    
}
                          

// @LINE:47
class ReverseAssets {
    

// @LINE:47
def at(path:String, file:String): play.api.mvc.HandlerRef[_] = new play.api.mvc.HandlerRef(
   controllers.Assets.at(path, file), HandlerDef(this, "controllers.Assets", "at", Seq(classOf[String], classOf[String]), "GET", """ Map static resources from the /public folder to the /assets URL path""", _prefix + """assets/$file<.+>""")
)
                      
    
}
                          
}
                  
      
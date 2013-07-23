// @SOURCE:C:/Users/acarey/Desktop/andrewregressionsite/regressionsite/conf/routes
// @HASH:ea6384fd908d1dfcbcdafd21dd02bdeea1f59298
// @DATE:Tue Jul 23 11:39:57 EDT 2013


import play.core._
import play.core.Router._
import play.core.j._

import play.api.mvc._
import play.libs.F

import Router.queryString

object Routes extends Router.Routes {

private var _prefix = "/"

def setPrefix(prefix: String) {
  _prefix = prefix  
  List[(String,Routes)]().foreach {
    case (p, router) => router.setPrefix(prefix + (if(prefix.endsWith("/")) "" else "/") + p)
  }
}

def prefix = _prefix

lazy val defaultPrefix = { if(Routes.prefix.endsWith("/")) "" else "/" } 


// @LINE:6
private[this] lazy val controllers_Application_index0 = Route("GET", PathPattern(List(StaticPart(Routes.prefix))))
        

// @LINE:9
private[this] lazy val controllers_Application_javascriptRoutes1 = Route("GET", PathPattern(List(StaticPart(Routes.prefix),StaticPart(Routes.defaultPrefix),StaticPart("assets/javascripts/routes"))))
        

// @LINE:13
private[this] lazy val controllers_Application_runIndex2 = Route("GET", PathPattern(List(StaticPart(Routes.prefix),StaticPart(Routes.defaultPrefix),StaticPart("runs"))))
        

// @LINE:14
private[this] lazy val controllers_Application_listRun3 = Route("GET", PathPattern(List(StaticPart(Routes.prefix),StaticPart(Routes.defaultPrefix),StaticPart("runs/"),DynamicPart("filterBy", """[^/]+""",true))))
        

// @LINE:15
private[this] lazy val controllers_Application_listPage4 = Route("GET", PathPattern(List(StaticPart(Routes.prefix),StaticPart(Routes.defaultPrefix),StaticPart("pages"))))
        

// @LINE:16
private[this] lazy val controllers_Application_listBug5 = Route("GET", PathPattern(List(StaticPart(Routes.prefix),StaticPart(Routes.defaultPrefix),StaticPart("bugs"))))
        

// @LINE:17
private[this] lazy val controllers_Application_overview6 = Route("GET", PathPattern(List(StaticPart(Routes.prefix),StaticPart(Routes.defaultPrefix),StaticPart("overview"))))
        

// @LINE:18
private[this] lazy val controllers_Application_getData7 = Route("GET", PathPattern(List(StaticPart(Routes.prefix),StaticPart(Routes.defaultPrefix),StaticPart("runData/"),DynamicPart("id", """[^/]+""",true))))
        

// @LINE:19
private[this] lazy val controllers_Application_dataList8 = Route("GET", PathPattern(List(StaticPart(Routes.prefix),StaticPart(Routes.defaultPrefix),StaticPart("dataList/"),DynamicPart("filter1", """[^/]+""",true),StaticPart("/"),DynamicPart("filter2", """[^/]+""",true),StaticPart("/"),DynamicPart("param1", """[^/]+""",true),StaticPart("/"),DynamicPart("param2", """[^/]+""",true))))
        

// @LINE:20
private[this] lazy val controllers_Application_bugData9 = Route("GET", PathPattern(List(StaticPart(Routes.prefix),StaticPart(Routes.defaultPrefix),StaticPart("bugData/"),DynamicPart("id", """[^/]+""",true))))
        

// @LINE:21
private[this] lazy val controllers_Application_recentRuns10 = Route("GET", PathPattern(List(StaticPart(Routes.prefix),StaticPart(Routes.defaultPrefix),StaticPart("recentRuns/"),DynamicPart("filter1", """[^/]+""",true),StaticPart("/"),DynamicPart("filter2", """[^/]+""",true),StaticPart("/"),DynamicPart("param1", """[^/]+""",true),StaticPart("/"),DynamicPart("param2", """[^/]+""",true),StaticPart("/"),DynamicPart("days", """[^/]+""",true))))
        

// @LINE:25
private[this] lazy val controllers_Application_listPageByRun11 = Route("GET", PathPattern(List(StaticPart(Routes.prefix),StaticPart(Routes.defaultPrefix),StaticPart("pagesbyrun/"),DynamicPart("id", """[^/]+""",true),StaticPart("/"),DynamicPart("d", """[^/]+""",true))))
        

// @LINE:28
private[this] lazy val controllers_Application_importRun12 = Route("GET", PathPattern(List(StaticPart(Routes.prefix),StaticPart(Routes.defaultPrefix),StaticPart("importrun"))))
        

// @LINE:29
private[this] lazy val controllers_AddToDB_saveRun13 = Route("POST", PathPattern(List(StaticPart(Routes.prefix),StaticPart(Routes.defaultPrefix),StaticPart("importrun"))))
        

// @LINE:30
private[this] lazy val controllers_NewRun_newRun14 = Route("GET", PathPattern(List(StaticPart(Routes.prefix),StaticPart(Routes.defaultPrefix),StaticPart("newrun"))))
        

// @LINE:31
private[this] lazy val controllers_NewRun_addNewRun15 = Route("POST", PathPattern(List(StaticPart(Routes.prefix),StaticPart(Routes.defaultPrefix),StaticPart("newrun"))))
        

// @LINE:34
private[this] lazy val controllers_Application_addBugNum16 = Route("POST", PathPattern(List(StaticPart(Routes.prefix),StaticPart(Routes.defaultPrefix),StaticPart("saveBugNum"))))
        

// @LINE:35
private[this] lazy val controllers_Application_addDiffDesc17 = Route("POST", PathPattern(List(StaticPart(Routes.prefix),StaticPart(Routes.defaultPrefix),StaticPart("saveDiffDesc"))))
        

// @LINE:38
private[this] lazy val controllers_Application_deleteRun18 = Route("GET", PathPattern(List(StaticPart(Routes.prefix),StaticPart(Routes.defaultPrefix),StaticPart("runs/delete/"),DynamicPart("runID", """[^/]+""",true))))
        

// @LINE:41
private[this] lazy val controllers_NewRun_downloadBatch19 = Route("POST", PathPattern(List(StaticPart(Routes.prefix),StaticPart(Routes.defaultPrefix),StaticPart("download"))))
        

// @LINE:42
private[this] lazy val controllers_Application_createFile20 = Route("GET", PathPattern(List(StaticPart(Routes.prefix),StaticPart(Routes.defaultPrefix),StaticPart("getExcel/"),DynamicPart("filter1", """[^/]+""",true),StaticPart("/"),DynamicPart("filter2", """[^/]+""",true),StaticPart("/"),DynamicPart("param1", """[^/]+""",true),StaticPart("/"),DynamicPart("param2", """[^/]+""",true))))
        

// @LINE:43
private[this] lazy val controllers_Application_pageExcel21 = Route("GET", PathPattern(List(StaticPart(Routes.prefix),StaticPart(Routes.defaultPrefix),StaticPart("pageExcel/"),DynamicPart("runID", """[^/]+""",true))))
        

// @LINE:47
private[this] lazy val controllers_Assets_at22 = Route("GET", PathPattern(List(StaticPart(Routes.prefix),StaticPart(Routes.defaultPrefix),StaticPart("assets/"),DynamicPart("file", """.+""",false))))
        
def documentation = List(("""GET""", prefix,"""controllers.Application.index()"""),("""GET""", prefix + (if(prefix.endsWith("/")) "" else "/") + """assets/javascripts/routes""","""controllers.Application.javascriptRoutes()"""),("""GET""", prefix + (if(prefix.endsWith("/")) "" else "/") + """runs""","""controllers.Application.runIndex"""),("""GET""", prefix + (if(prefix.endsWith("/")) "" else "/") + """runs/$filterBy<[^/]+>""","""controllers.Application.listRun(p:Int ?= 0, s:String ?= "name", o:String ?= "asc", f:String ?= "", filterBy:String)"""),("""GET""", prefix + (if(prefix.endsWith("/")) "" else "/") + """pages""","""controllers.Application.listPage(p:Int ?= 0, s:String ?= "name", o:String ?= "asc", f:String ?= "")"""),("""GET""", prefix + (if(prefix.endsWith("/")) "" else "/") + """bugs""","""controllers.Application.listBug(p:Int ?= 0, s:String ?= "number", o:String ?= "asc", f:String ?= "")"""),("""GET""", prefix + (if(prefix.endsWith("/")) "" else "/") + """overview""","""controllers.Application.overview"""),("""GET""", prefix + (if(prefix.endsWith("/")) "" else "/") + """runData/$id<[^/]+>""","""controllers.Application.getData(id:Long)"""),("""GET""", prefix + (if(prefix.endsWith("/")) "" else "/") + """dataList/$filter1<[^/]+>/$filter2<[^/]+>/$param1<[^/]+>/$param2<[^/]+>""","""controllers.Application.dataList(filter1:String, filter2:String, param1:String, param2:String)"""),("""GET""", prefix + (if(prefix.endsWith("/")) "" else "/") + """bugData/$id<[^/]+>""","""controllers.Application.bugData(id:Long)"""),("""GET""", prefix + (if(prefix.endsWith("/")) "" else "/") + """recentRuns/$filter1<[^/]+>/$filter2<[^/]+>/$param1<[^/]+>/$param2<[^/]+>/$days<[^/]+>""","""controllers.Application.recentRuns(filter1:String, filter2:String, param1:String, param2:String, days:Int)"""),("""GET""", prefix + (if(prefix.endsWith("/")) "" else "/") + """pagesbyrun/$id<[^/]+>/$d<[^/]+>""","""controllers.Application.listPageByRun(p:Int ?= 0, s:String ?= "name", o:String ?= "asc", id:Long, f:String ?= "", d:String)"""),("""GET""", prefix + (if(prefix.endsWith("/")) "" else "/") + """importrun""","""controllers.Application.importRun()"""),("""POST""", prefix + (if(prefix.endsWith("/")) "" else "/") + """importrun""","""controllers.AddToDB.saveRun()"""),("""GET""", prefix + (if(prefix.endsWith("/")) "" else "/") + """newrun""","""controllers.NewRun.newRun()"""),("""POST""", prefix + (if(prefix.endsWith("/")) "" else "/") + """newrun""","""controllers.NewRun.addNewRun()"""),("""POST""", prefix + (if(prefix.endsWith("/")) "" else "/") + """saveBugNum""","""controllers.Application.addBugNum()"""),("""POST""", prefix + (if(prefix.endsWith("/")) "" else "/") + """saveDiffDesc""","""controllers.Application.addDiffDesc()"""),("""GET""", prefix + (if(prefix.endsWith("/")) "" else "/") + """runs/delete/$runID<[^/]+>""","""controllers.Application.deleteRun(runID:Long)"""),("""POST""", prefix + (if(prefix.endsWith("/")) "" else "/") + """download""","""controllers.NewRun.downloadBatch()"""),("""GET""", prefix + (if(prefix.endsWith("/")) "" else "/") + """getExcel/$filter1<[^/]+>/$filter2<[^/]+>/$param1<[^/]+>/$param2<[^/]+>""","""controllers.Application.createFile(filter1:String, filter2:String, param1:String, param2:String)"""),("""GET""", prefix + (if(prefix.endsWith("/")) "" else "/") + """pageExcel/$runID<[^/]+>""","""controllers.Application.pageExcel(runID:Long)"""),("""GET""", prefix + (if(prefix.endsWith("/")) "" else "/") + """assets/$file<.+>""","""controllers.Assets.at(path:String = "/public", file:String)""")).foldLeft(List.empty[(String,String,String)]) { (s,e) => e.asInstanceOf[Any] match {
  case r @ (_,_,_) => s :+ r.asInstanceOf[(String,String,String)]
  case l => s ++ l.asInstanceOf[List[(String,String,String)]] 
}}
       
    
def routes:PartialFunction[RequestHeader,Handler] = {        

// @LINE:6
case controllers_Application_index0(params) => {
   call { 
        invokeHandler(controllers.Application.index(), HandlerDef(this, "controllers.Application", "index", Nil,"GET", """ Home page""", Routes.prefix + """"""))
   }
}
        

// @LINE:9
case controllers_Application_javascriptRoutes1(params) => {
   call { 
        invokeHandler(controllers.Application.javascriptRoutes(), HandlerDef(this, "controllers.Application", "javascriptRoutes", Nil,"GET", """ JavaScript Routes""", Routes.prefix + """assets/javascripts/routes"""))
   }
}
        

// @LINE:13
case controllers_Application_runIndex2(params) => {
   call { 
        invokeHandler(controllers.Application.runIndex, HandlerDef(this, "controllers.Application", "runIndex", Nil,"GET", """""", Routes.prefix + """runs"""))
   }
}
        

// @LINE:14
case controllers_Application_listRun3(params) => {
   call(params.fromQuery[Int]("p", Some(0)), params.fromQuery[String]("s", Some("name")), params.fromQuery[String]("o", Some("asc")), params.fromQuery[String]("f", Some("")), params.fromPath[String]("filterBy", None)) { (p, s, o, f, filterBy) =>
        invokeHandler(controllers.Application.listRun(p, s, o, f, filterBy), HandlerDef(this, "controllers.Application", "listRun", Seq(classOf[Int], classOf[String], classOf[String], classOf[String], classOf[String]),"GET", """""", Routes.prefix + """runs/$filterBy<[^/]+>"""))
   }
}
        

// @LINE:15
case controllers_Application_listPage4(params) => {
   call(params.fromQuery[Int]("p", Some(0)), params.fromQuery[String]("s", Some("name")), params.fromQuery[String]("o", Some("asc")), params.fromQuery[String]("f", Some(""))) { (p, s, o, f) =>
        invokeHandler(controllers.Application.listPage(p, s, o, f), HandlerDef(this, "controllers.Application", "listPage", Seq(classOf[Int], classOf[String], classOf[String], classOf[String]),"GET", """""", Routes.prefix + """pages"""))
   }
}
        

// @LINE:16
case controllers_Application_listBug5(params) => {
   call(params.fromQuery[Int]("p", Some(0)), params.fromQuery[String]("s", Some("number")), params.fromQuery[String]("o", Some("asc")), params.fromQuery[String]("f", Some(""))) { (p, s, o, f) =>
        invokeHandler(controllers.Application.listBug(p, s, o, f), HandlerDef(this, "controllers.Application", "listBug", Seq(classOf[Int], classOf[String], classOf[String], classOf[String]),"GET", """""", Routes.prefix + """bugs"""))
   }
}
        

// @LINE:17
case controllers_Application_overview6(params) => {
   call { 
        invokeHandler(controllers.Application.overview, HandlerDef(this, "controllers.Application", "overview", Nil,"GET", """""", Routes.prefix + """overview"""))
   }
}
        

// @LINE:18
case controllers_Application_getData7(params) => {
   call(params.fromPath[Long]("id", None)) { (id) =>
        invokeHandler(controllers.Application.getData(id), HandlerDef(this, "controllers.Application", "getData", Seq(classOf[Long]),"GET", """""", Routes.prefix + """runData/$id<[^/]+>"""))
   }
}
        

// @LINE:19
case controllers_Application_dataList8(params) => {
   call(params.fromPath[String]("filter1", None), params.fromPath[String]("filter2", None), params.fromPath[String]("param1", None), params.fromPath[String]("param2", None)) { (filter1, filter2, param1, param2) =>
        invokeHandler(controllers.Application.dataList(filter1, filter2, param1, param2), HandlerDef(this, "controllers.Application", "dataList", Seq(classOf[String], classOf[String], classOf[String], classOf[String]),"GET", """""", Routes.prefix + """dataList/$filter1<[^/]+>/$filter2<[^/]+>/$param1<[^/]+>/$param2<[^/]+>"""))
   }
}
        

// @LINE:20
case controllers_Application_bugData9(params) => {
   call(params.fromPath[Long]("id", None)) { (id) =>
        invokeHandler(controllers.Application.bugData(id), HandlerDef(this, "controllers.Application", "bugData", Seq(classOf[Long]),"GET", """""", Routes.prefix + """bugData/$id<[^/]+>"""))
   }
}
        

// @LINE:21
case controllers_Application_recentRuns10(params) => {
   call(params.fromPath[String]("filter1", None), params.fromPath[String]("filter2", None), params.fromPath[String]("param1", None), params.fromPath[String]("param2", None), params.fromPath[Int]("days", None)) { (filter1, filter2, param1, param2, days) =>
        invokeHandler(controllers.Application.recentRuns(filter1, filter2, param1, param2, days), HandlerDef(this, "controllers.Application", "recentRuns", Seq(classOf[String], classOf[String], classOf[String], classOf[String], classOf[Int]),"GET", """""", Routes.prefix + """recentRuns/$filter1<[^/]+>/$filter2<[^/]+>/$param1<[^/]+>/$param2<[^/]+>/$days<[^/]+>"""))
   }
}
        

// @LINE:25
case controllers_Application_listPageByRun11(params) => {
   call(params.fromQuery[Int]("p", Some(0)), params.fromQuery[String]("s", Some("name")), params.fromQuery[String]("o", Some("asc")), params.fromPath[Long]("id", None), params.fromQuery[String]("f", Some("")), params.fromPath[String]("d", None)) { (p, s, o, id, f, d) =>
        invokeHandler(controllers.Application.listPageByRun(p, s, o, id, f, d), HandlerDef(this, "controllers.Application", "listPageByRun", Seq(classOf[Int], classOf[String], classOf[String], classOf[Long], classOf[String], classOf[String]),"GET", """ page by run""", Routes.prefix + """pagesbyrun/$id<[^/]+>/$d<[^/]+>"""))
   }
}
        

// @LINE:28
case controllers_Application_importRun12(params) => {
   call { 
        invokeHandler(controllers.Application.importRun(), HandlerDef(this, "controllers.Application", "importRun", Nil,"GET", """ Edit pages""", Routes.prefix + """importrun"""))
   }
}
        

// @LINE:29
case controllers_AddToDB_saveRun13(params) => {
   call { 
        invokeHandler(controllers.AddToDB.saveRun(), HandlerDef(this, "controllers.AddToDB", "saveRun", Nil,"POST", """""", Routes.prefix + """importrun"""))
   }
}
        

// @LINE:30
case controllers_NewRun_newRun14(params) => {
   call { 
        invokeHandler(controllers.NewRun.newRun(), HandlerDef(this, "controllers.NewRun", "newRun", Nil,"GET", """""", Routes.prefix + """newrun"""))
   }
}
        

// @LINE:31
case controllers_NewRun_addNewRun15(params) => {
   call { 
        invokeHandler(controllers.NewRun.addNewRun(), HandlerDef(this, "controllers.NewRun", "addNewRun", Nil,"POST", """""", Routes.prefix + """newrun"""))
   }
}
        

// @LINE:34
case controllers_Application_addBugNum16(params) => {
   call { 
        invokeHandler(controllers.Application.addBugNum(), HandlerDef(this, "controllers.Application", "addBugNum", Nil,"POST", """ Manual data entry after run submission""", Routes.prefix + """saveBugNum"""))
   }
}
        

// @LINE:35
case controllers_Application_addDiffDesc17(params) => {
   call { 
        invokeHandler(controllers.Application.addDiffDesc(), HandlerDef(this, "controllers.Application", "addDiffDesc", Nil,"POST", """""", Routes.prefix + """saveDiffDesc"""))
   }
}
        

// @LINE:38
case controllers_Application_deleteRun18(params) => {
   call(params.fromPath[Long]("runID", None)) { (runID) =>
        invokeHandler(controllers.Application.deleteRun(runID), HandlerDef(this, "controllers.Application", "deleteRun", Seq(classOf[Long]),"GET", """ Deletions""", Routes.prefix + """runs/delete/$runID<[^/]+>"""))
   }
}
        

// @LINE:41
case controllers_NewRun_downloadBatch19(params) => {
   call { 
        invokeHandler(controllers.NewRun.downloadBatch(), HandlerDef(this, "controllers.NewRun", "downloadBatch", Nil,"POST", """ Download""", Routes.prefix + """download"""))
   }
}
        

// @LINE:42
case controllers_Application_createFile20(params) => {
   call(params.fromPath[String]("filter1", None), params.fromPath[String]("filter2", None), params.fromPath[String]("param1", None), params.fromPath[String]("param2", None)) { (filter1, filter2, param1, param2) =>
        invokeHandler(controllers.Application.createFile(filter1, filter2, param1, param2), HandlerDef(this, "controllers.Application", "createFile", Seq(classOf[String], classOf[String], classOf[String], classOf[String]),"GET", """""", Routes.prefix + """getExcel/$filter1<[^/]+>/$filter2<[^/]+>/$param1<[^/]+>/$param2<[^/]+>"""))
   }
}
        

// @LINE:43
case controllers_Application_pageExcel21(params) => {
   call(params.fromPath[Long]("runID", None)) { (runID) =>
        invokeHandler(controllers.Application.pageExcel(runID), HandlerDef(this, "controllers.Application", "pageExcel", Seq(classOf[Long]),"GET", """""", Routes.prefix + """pageExcel/$runID<[^/]+>"""))
   }
}
        

// @LINE:47
case controllers_Assets_at22(params) => {
   call(Param[String]("path", Right("/public")), params.fromPath[String]("file", None)) { (path, file) =>
        invokeHandler(controllers.Assets.at(path, file), HandlerDef(this, "controllers.Assets", "at", Seq(classOf[String], classOf[String]),"GET", """ Map static resources from the /public folder to the /assets URL path""", Routes.prefix + """assets/$file<.+>"""))
   }
}
        
}
    
}
        
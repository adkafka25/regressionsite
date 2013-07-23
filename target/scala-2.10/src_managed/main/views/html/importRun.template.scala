
package views.html

import play.templates._
import play.templates.TemplateMagic._

import play.api.templates._
import play.api.templates.PlayMagic._
import models._
import controllers._
import java.lang._
import java.util._
import scala.collection.JavaConversions._
import scala.collection.JavaConverters._
import play.api.i18n._
import play.core.j.PlayMagicForJava._
import play.mvc._
import play.data._
import play.api.data.Field
import play.mvc.Http.Context.Implicit._
import views.html._
/**/
object importRun extends BaseScalaTemplate[play.api.templates.Html,Format[play.api.templates.Html]](play.api.templates.HtmlFormat) with play.api.templates.Template1[Form[Run],play.api.templates.Html] {

    /**/
    def apply/*1.2*/(runForm: Form[Run]):play.api.templates.Html = {
        _display_ {import helper._

implicit def /*5.2*/implicitFieldConstructor/*5.26*/ = {{ FieldConstructor(twitterBootstrapInput.render) }};
Seq[Any](format.raw/*1.22*/("""

"""),format.raw/*4.1*/("""
"""),format.raw/*5.80*/(""" 

"""),_display_(Seq[Any](/*7.2*/homeSkeleton/*7.14*/ {_display_(Seq[Any](format.raw/*7.16*/("""
     <link rel="stylesheet" type="text/css" href=""""),_display_(Seq[Any](/*8.52*/routes/*8.58*/.Assets.at("stylesheets/bootstrap.min.css"))),format.raw/*8.101*/("""">
	<link rel="stylesheet" type="text/css" media="screen" href=""""),_display_(Seq[Any](/*9.63*/routes/*9.69*/.Assets.at("stylesheets/datepicker.css"))),format.raw/*9.109*/("""">
	<script type="text/javascript" src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src='"""),_display_(Seq[Any](/*11.39*/routes/*11.45*/.Assets.at("js/bootstrap-datepicker.js"))),format.raw/*11.85*/("""' charset="utf-8"></script>
 	
 
	<!-- bootbox code -->
	<script src=""""),_display_(Seq[Any](/*15.16*/routes/*15.22*/.Assets.at("js/bootbox.min.js"))),format.raw/*15.53*/(""""></script>
	<script type="text/javascript">
	function checkForm()"""),format.raw/*17.22*/("""{"""),format.raw/*17.23*/("""
		if (document.newRun.version_name.value == "")"""),format.raw/*18.48*/("""{"""),format.raw/*18.49*/("""
			bootbox.alert("Please select a Version", function() """),format.raw/*19.56*/("""{"""),format.raw/*19.57*/("""
				"""),format.raw/*20.5*/("""}"""),format.raw/*20.6*/(""");
			return false;
		"""),format.raw/*22.3*/("""}"""),format.raw/*22.4*/("""
		else if ( document.newRun.format_id.value == "")"""),format.raw/*23.51*/("""{"""),format.raw/*23.52*/("""
			bootbox.alert("Please select a File Format", function() """),format.raw/*24.60*/("""{"""),format.raw/*24.61*/("""
			"""),format.raw/*25.4*/("""}"""),format.raw/*25.5*/(""");
		return false;
		"""),format.raw/*27.3*/("""}"""),format.raw/*27.4*/("""
		else"""),format.raw/*28.7*/("""{"""),format.raw/*28.8*/("""
			return verifySubmit();
		"""),format.raw/*30.3*/("""}"""),format.raw/*30.4*/("""
	"""),format.raw/*31.2*/("""}"""),format.raw/*31.3*/("""
	function getSelectedValue(elementId)"""),format.raw/*32.38*/("""{"""),format.raw/*32.39*/("""
		return document.getElementById(elementId).options[document.getElementById(elementId).selectedIndex].text;
	"""),format.raw/*34.2*/("""}"""),format.raw/*34.3*/("""
	function getPlatform(path)"""),format.raw/*35.28*/("""{"""),format.raw/*35.29*/("""
		pathArray=path.split("\\");
		var platformIndex=4; //this is in which spot the platform comes up in file name \\1\2\3...
		return pathArray[platformIndex];
	"""),format.raw/*39.2*/("""}"""),format.raw/*39.3*/("""
	function verifySubmit()"""),format.raw/*40.25*/("""{"""),format.raw/*40.26*/("""
		//Get all current values at this time
		var runName=document.newRun.name.value;
		var runPath=document.newRun.path.value;
		var platform=getPlatform(runPath);
		var version=getSelectedValue("version_name");
		var format=getSelectedValue("format_id");
		var date=document.newRun.dp1.value;
		var svn=document.newRun.svn_num.value;
		
		var message="Are you sure you would like to submit this run?";
		//Prompt for confirmation
			var x=confirm("Run Name = "+runName+"\n"+
				"Run Path = "+runPath+"\n"+
				"Platform = "+platform+"\n"+
				"Version = "+version+"\n"+
				"Format = "+format+"\n"+
				"Date = "+date+"\n"+
				"SVN = "+svn+"\n"+
				message);
			if (x==true)"""),format.raw/*60.16*/("""{"""),format.raw/*60.17*/("""	
				document.newRun.submit();
			"""),format.raw/*62.4*/("""}"""),format.raw/*62.5*/("""
			else"""),format.raw/*63.8*/("""{"""),format.raw/*63.9*/("""
				return false;
			"""),format.raw/*65.4*/("""}"""),format.raw/*65.5*/("""
		return true;
	"""),format.raw/*67.2*/("""}"""),format.raw/*67.3*/("""

	function addVersion()"""),format.raw/*69.23*/("""{"""),format.raw/*69.24*/("""
		 bootbox.prompt("What is the new version?", function(result) """),format.raw/*70.64*/("""{"""),format.raw/*70.65*/("""
			if (result == null) """),format.raw/*71.24*/("""{"""),format.raw/*71.25*/("""
			return true;
			"""),format.raw/*73.4*/("""}"""),format.raw/*73.5*/(""" else """),format.raw/*73.11*/("""{"""),format.raw/*73.12*/("""

				var x=document.getElementById("version_name");
				var option=document.createElement("option");
				option.text=result;
				try"""),format.raw/*78.8*/("""{"""),format.raw/*78.9*/("""// for IE earlier than version 8
					x.add(option,x.options[null]);
				"""),format.raw/*80.5*/("""}"""),format.raw/*80.6*/("""
				catch (e)"""),format.raw/*81.14*/("""{"""),format.raw/*81.15*/("""
					x.add(option,null);
				"""),format.raw/*83.5*/("""}"""),format.raw/*83.6*/("""
				x.selectedIndex=x.length-1; //select new version
				return true;
			"""),format.raw/*86.4*/("""}"""),format.raw/*86.5*/("""
			"""),format.raw/*87.4*/("""}"""),format.raw/*87.5*/(""");
		//var versionName = prompt("What is the new version?");
	"""),format.raw/*89.2*/("""}"""),format.raw/*89.3*/("""
	function addVersion(versionName)"""),format.raw/*90.34*/("""{"""),format.raw/*90.35*/("""
		var versionName = prompt("What is the new version?(Platorm [java or native] will be added automatically");
	
		var x=document.getElementById("version_name");
		var option=document.createElement("option");
		option.text=versionName;
		try"""),format.raw/*96.6*/("""{"""),format.raw/*96.7*/("""// for IE earlier than version 8
			x.add(option,x.options[null]);
		"""),format.raw/*98.3*/("""}"""),format.raw/*98.4*/("""
		catch (e)"""),format.raw/*99.12*/("""{"""),format.raw/*99.13*/("""
			x.add(option,null);
		"""),format.raw/*101.3*/("""}"""),format.raw/*101.4*/("""
		x.selectedIndex=x.length-1; //select new version
		return false;
		
	"""),format.raw/*105.2*/("""}"""),format.raw/*105.3*/("""
	$(function()"""),format.raw/*106.14*/("""{"""),format.raw/*106.15*/("""//for picking a date
		$('#dp1').datepicker("""),format.raw/*107.24*/("""{"""),format.raw/*107.25*/("""
			format: 'yyyy-mm-dd'
		"""),format.raw/*109.3*/("""}"""),format.raw/*109.4*/(""");
	"""),format.raw/*110.2*/("""}"""),format.raw/*110.3*/(""");
	</script>
	
	
    <h1>Import an existing regression run</h1>
    
    <form name=newRun action=""""),_display_(Seq[Any](/*116.32*/routes/*116.38*/.AddToDB.saveRun())),format.raw/*116.56*/("""" method="POST" >    
        <fieldset>
        
            <div class="clearfix">
				<label for="name">Run Name</label>
				<div class="input">
					<input id="name" type="text" value="" name="name" required pattern="(\w|\s|\.|-)+">
					<span class="help-inline">Required, only word characters</span>
				</div>
			</div>
			
			<div class="clearfix ">
				<label for="path">Path to Issues folder</label>
				<div class="input">
					<input type="text" id="path" name="path" value="" required pattern="..(S|s)nowtest.(R|r)egression.(java|native).*(I|i)ssues.*">
					<span class="help-inline">Required. ex: "\\snowtest\Regression\java\13.5-Build2.1-AFP\Issues.13.5-Build2-AFP" <br />
					Must begin with \\snowtest\Regression\(java or native)\....\Issues*"</span> 
				</div>
			</div>
			
			<div class="clearfix ">
				<label for="version_name">Version</label>
				<div class="input">
				<select id="version_name" name="version.name" >
					<option class="blank" value="">-- Choose a Version --</option>
					"""),_display_(Seq[Any](/*141.7*/for((key, value) <- Version.options()) yield /*141.45*/{_display_(Seq[Any](format.raw/*141.46*/("""
						<option value=""""),_display_(Seq[Any](/*142.23*/key)),format.raw/*142.26*/("""">"""),_display_(Seq[Any](/*142.29*/value)),format.raw/*142.34*/("""</option>
					""")))})),format.raw/*143.7*/("""
				</select>
				<button class="btn" onclick="return addVersion()">Add new version...</button>
				<span class="help-inline">Required</span>
				</div>
			</div>
			
			<div class="clearfix ">
				<label for="format_id">Format</label>
				<div class="input">
				<select id="format_id" name="format.id" >
					<option class="blank" value="">-- Choose a Format --</option>
					"""),_display_(Seq[Any](/*155.7*/for((key, value) <- FileFormat.options()) yield /*155.48*/{_display_(Seq[Any](format.raw/*155.49*/("""
						<option value=""""),_display_(Seq[Any](/*156.23*/key)),format.raw/*156.26*/("""">"""),_display_(Seq[Any](/*156.29*/value)),format.raw/*156.34*/("""</option>
					""")))})),format.raw/*157.7*/("""
				</select>
					<span class="help-inline">Required</span> 
				</div>
			</div>
			
			<div class="clearfix ">
				<label for="date_name">Date</label>
				<div class="datepicker input">
					<input type="date" class="datepicker" id="dp1" data-date-format="yyyy-mm-dd" name="date.name" value="" required pattern="\d"""),format.raw/*166.129*/("""{"""),format.raw/*166.130*/("""4"""),format.raw/*166.131*/("""}"""),format.raw/*166.132*/("""-\d"""),format.raw/*166.135*/("""{"""),format.raw/*166.136*/("""2"""),format.raw/*166.137*/("""}"""),format.raw/*166.138*/("""-\d"""),format.raw/*166.141*/("""{"""),format.raw/*166.142*/("""2"""),format.raw/*166.143*/("""}"""),format.raw/*166.144*/("""" >
				</div>
			</div>
			
			<div class="clearfix ">
				<label for="svn_num">SVN</label>
				<div class="input">
				<input type="text" id="svn_num" name="svn.num" value="" pattern="\d*">
					<span class="help-inline">Not Required (Numbers only)</span> 
				</div>
			</div>
			
        </fieldset>
        
        <div class="actions">
            <input type="submit" value="Create this run" class="btn primary" onclick="return checkForm()"> or 
            <a href=""""),_display_(Seq[Any](/*182.23*/routes/*182.29*/.Application.index())),format.raw/*182.49*/("""" class="btn">Cancel</a> 
        </div>
        
    </form>
    
""")))})))}
    }
    
    def render(runForm:Form[Run]): play.api.templates.Html = apply(runForm)
    
    def f:((Form[Run]) => play.api.templates.Html) = (runForm) => apply(runForm)
    
    def ref: this.type = this

}
                /*
                    -- GENERATED --
                    DATE: Tue Jul 23 11:40:03 EDT 2013
                    SOURCE: C:/Users/acarey/Desktop/andrewregressionsite/regressionsite/app/views/importRun.scala.html
                    HASH: 17e3164c182518659ce7ee916564d2f4e1b8ad8f
                    MATRIX: 730->1|836->46|868->70|952->21|982->43|1011->124|1051->130|1071->142|1110->144|1198->197|1212->203|1277->246|1378->312|1392->318|1454->358|1624->492|1639->498|1701->538|1812->613|1827->619|1880->650|1976->718|2005->719|2082->768|2111->769|2196->826|2225->827|2258->833|2286->834|2337->858|2365->859|2445->911|2474->912|2563->973|2592->974|2624->979|2652->980|2702->1003|2730->1004|2765->1012|2793->1013|2851->1044|2879->1045|2909->1048|2937->1049|3004->1088|3033->1089|3172->1201|3200->1202|3257->1231|3286->1232|3477->1396|3505->1397|3559->1423|3588->1424|4312->2120|4341->2121|4405->2158|4433->2159|4469->2168|4497->2169|4548->2193|4576->2194|4622->2213|4650->2214|4704->2240|4733->2241|4826->2306|4855->2307|4908->2332|4937->2333|4986->2355|5014->2356|5048->2362|5077->2363|5242->2501|5270->2502|5372->2577|5400->2578|5443->2593|5472->2594|5531->2626|5559->2627|5663->2704|5691->2705|5723->2710|5751->2711|5842->2775|5870->2776|5933->2811|5962->2812|6235->3058|6263->3059|6361->3130|6389->3131|6430->3144|6459->3145|6515->3173|6544->3174|6648->3250|6677->3251|6721->3266|6751->3267|6825->3312|6855->3313|6912->3342|6941->3343|6974->3348|7003->3349|7147->3456|7163->3462|7204->3480|8284->4524|8339->4562|8379->4563|8440->4587|8466->4590|8506->4593|8534->4598|8583->4615|9011->5007|9069->5048|9109->5049|9170->5073|9196->5076|9236->5079|9264->5084|9313->5101|9670->5428|9701->5429|9732->5430|9763->5431|9796->5434|9827->5435|9858->5436|9889->5437|9922->5440|9953->5441|9984->5442|10015->5443|10544->5935|10560->5941|10603->5961
                    LINES: 26->1|29->5|29->5|30->1|32->4|33->5|35->7|35->7|35->7|36->8|36->8|36->8|37->9|37->9|37->9|39->11|39->11|39->11|43->15|43->15|43->15|45->17|45->17|46->18|46->18|47->19|47->19|48->20|48->20|50->22|50->22|51->23|51->23|52->24|52->24|53->25|53->25|55->27|55->27|56->28|56->28|58->30|58->30|59->31|59->31|60->32|60->32|62->34|62->34|63->35|63->35|67->39|67->39|68->40|68->40|88->60|88->60|90->62|90->62|91->63|91->63|93->65|93->65|95->67|95->67|97->69|97->69|98->70|98->70|99->71|99->71|101->73|101->73|101->73|101->73|106->78|106->78|108->80|108->80|109->81|109->81|111->83|111->83|114->86|114->86|115->87|115->87|117->89|117->89|118->90|118->90|124->96|124->96|126->98|126->98|127->99|127->99|129->101|129->101|133->105|133->105|134->106|134->106|135->107|135->107|137->109|137->109|138->110|138->110|144->116|144->116|144->116|169->141|169->141|169->141|170->142|170->142|170->142|170->142|171->143|183->155|183->155|183->155|184->156|184->156|184->156|184->156|185->157|194->166|194->166|194->166|194->166|194->166|194->166|194->166|194->166|194->166|194->166|194->166|194->166|210->182|210->182|210->182
                    -- GENERATED --
                */
            
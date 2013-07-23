
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
object newRun extends BaseScalaTemplate[play.api.templates.Html,Format[play.api.templates.Html]](play.api.templates.HtmlFormat) with play.api.templates.Template1[Form[models.NewRun],play.api.templates.Html] {

    /**/
    def apply/*1.2*/(runForm: Form[models.NewRun]):play.api.templates.Html = {
        _display_ {import helper._

implicit def /*5.2*/implicitFieldConstructor/*5.26*/ = {{ FieldConstructor(twitterBootstrapInput.render) }};
Seq[Any](format.raw/*1.32*/("""

"""),format.raw/*4.1*/("""
"""),format.raw/*5.80*/(""" 

"""),_display_(Seq[Any](/*7.2*/homeSkeleton/*7.14*/ {_display_(Seq[Any](format.raw/*7.16*/("""
	<script type="text/javascript" src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
	<script src=""""),_display_(Seq[Any](/*9.16*/routes/*9.22*/.Assets.at("js/bootbox.min.js"))),format.raw/*9.53*/(""""></script>
	
	<script type="text/javascript">
	function checkForm(option)"""),format.raw/*12.28*/("""{"""),format.raw/*12.29*/("""//option is where to go next...
		//Determine if any formats are checked
		var elements = document.getElementsByClassName("format");
		var anyChecked=false;
		for(var i=0; i<elements.length; i++)"""),format.raw/*16.39*/("""{"""),format.raw/*16.40*/("""
			if(elements[i].checked==true)"""),format.raw/*17.33*/("""{"""),format.raw/*17.34*/("""
				anyChecked=true;
			"""),format.raw/*19.4*/("""}"""),format.raw/*19.5*/("""
		"""),format.raw/*20.3*/("""}"""),format.raw/*20.4*/("""
		//Check neccesary elements
		if (document.newRun.platform_id.value == "")"""),format.raw/*22.47*/("""{"""),format.raw/*22.48*/("""
			alert("Please select a platform");
			return false;
		"""),format.raw/*25.3*/("""}"""),format.raw/*25.4*/("""
		else if ( anyChecked==false )"""),format.raw/*26.32*/("""{"""),format.raw/*26.33*/("""
			alert("Please select a file format");
			return false;
		"""),format.raw/*29.3*/("""}"""),format.raw/*29.4*/("""
		else"""),format.raw/*30.7*/("""{"""),format.raw/*30.8*/("""
			return verifySubmit(option);
		"""),format.raw/*32.3*/("""}"""),format.raw/*32.4*/("""
	"""),format.raw/*33.2*/("""}"""),format.raw/*33.3*/("""
	function getSelectedValue(elementId)"""),format.raw/*34.38*/("""{"""),format.raw/*34.39*/("""
		return document.getElementById(elementId).options[document.getElementById(elementId).selectedIndex].text;
	"""),format.raw/*36.2*/("""}"""),format.raw/*36.3*/("""
	function getCheckedBoxes()"""),format.raw/*37.28*/("""{"""),format.raw/*37.29*/("""
		var checked = "";
		$("input:checkbox[name=format]:checked").each(function()"""),format.raw/*39.59*/("""{"""),format.raw/*39.60*/(""" //for each checked box....
			checked=checked+$(this).val()+"," // add $(this).val() to your array
		"""),format.raw/*41.3*/("""}"""),format.raw/*41.4*/(""");
		//Get rid of last ","
		checked=checked.substring(0,checked.lastIndexOf(","));
		//set hidden field formats to this value
		document.getElementById("formats").value=checked;
		
		return checked;
	"""),format.raw/*48.2*/("""}"""),format.raw/*48.3*/("""
	function getInputDirs(checkedFormats)"""),format.raw/*49.39*/("""{"""),format.raw/*49.40*/("""//Input is a comma seperated list of formats
		var formats = checkedFormats.split(",");
		var inputDirs = "";
		//Add each input dir for every checked format
		for(var i =0; i<formats.length; i++)"""),format.raw/*53.39*/("""{"""),format.raw/*53.40*/("""
			inputDirs+=document.getElementById("inputDir-"+formats[i]).value+",";
		"""),format.raw/*55.3*/("""}"""),format.raw/*55.4*/("""
		//Get rid of last ","
		inputDirs=inputDirs.substring(0,inputDirs.lastIndexOf(","));
		//set hidden field formats to this value
		document.getElementById("inputDirs").value=inputDirs;
		return inputDirs;
	"""),format.raw/*61.2*/("""}"""),format.raw/*61.3*/("""
	function verifySubmit(option)"""),format.raw/*62.31*/("""{"""),format.raw/*62.32*/("""
		//Get all current values at this time
		var runName=document.newRun.name.value;
		var selectedFormats=getCheckedBoxes();
		var platform=getSelectedValue("platform_id");
		var compDir=document.newRun.compDir.value;
		var inputDirs=getInputDirs(selectedFormats);
		
		var message="Are you sure you would like to submit this run for "+option+"?";
		//Prompt for confirmation
		
		//Prepare message
		var formats = selectedFormats.split(",");
		var dirs = inputDirs.split(",");
		var listInfo=""
		for(var i = 0; i<formats.length; i++)"""),format.raw/*77.40*/("""{"""),format.raw/*77.41*/("""
			listInfo=listInfo+"\t"+formats[i]+" -> "+dirs[i]+"\n";
		"""),format.raw/*79.3*/("""}"""),format.raw/*79.4*/("""
		var x=confirm("Run Name = "+runName+"\n"+
			"Platform = "+platform+"\n"+
			"Comparison Directory = "+compDir+"\n"+
			"Formats & Input Directories = \n"+
			listInfo+
			"\n"+
			message
			);
		
		
		if (x==true)"""),format.raw/*90.15*/("""{"""),format.raw/*90.16*/("""
			if(option=="download")"""),format.raw/*91.26*/("""{"""),format.raw/*91.27*/("""  //Delete...
				alert("Make this method");
				return false;
			"""),format.raw/*94.4*/("""}"""),format.raw/*94.5*/("""
			else if(option=="output")"""),format.raw/*95.29*/("""{"""),format.raw/*95.30*/("""
				document.newRun.submit();
			"""),format.raw/*97.4*/("""}"""),format.raw/*97.5*/("""
			else"""),format.raw/*98.8*/("""{"""),format.raw/*98.9*/("""
				alert("Invalid option. Please choose wither output OR Download");
				return false;
			"""),format.raw/*101.4*/("""}"""),format.raw/*101.5*/("""
			
		"""),format.raw/*103.3*/("""}"""),format.raw/*103.4*/("""
		else"""),format.raw/*104.7*/("""{"""),format.raw/*104.8*/("""
			return false;
		"""),format.raw/*106.3*/("""}"""),format.raw/*106.4*/("""
	"""),format.raw/*107.2*/("""}"""),format.raw/*107.3*/("""
	function selectFormats()"""),format.raw/*108.26*/("""{"""),format.raw/*108.27*/("""
		var formats = document.getElementsByClassName("format");
		var defaults = document.getElementsByClassName("defaults");
		var anyChecked=false;
		//Check if any are checked
		for(var i=0; i<formats.length; i++)"""),format.raw/*113.38*/("""{"""),format.raw/*113.39*/("""
			if(formats[i].checked==true)"""),format.raw/*114.32*/("""{"""),format.raw/*114.33*/("""
				anyChecked=true;
			"""),format.raw/*116.4*/("""}"""),format.raw/*116.5*/("""
		"""),format.raw/*117.3*/("""}"""),format.raw/*117.4*/("""
		if(anyChecked)"""),format.raw/*118.17*/("""{"""),format.raw/*118.18*/("""//uncheck all
			for(var i=0; i<formats.length; i++)"""),format.raw/*119.39*/("""{"""),format.raw/*119.40*/("""
				formats[i].checked=false;
				$('#' + defaults[i].id).toggle(false);
			"""),format.raw/*122.4*/("""}"""),format.raw/*122.5*/("""
		"""),format.raw/*123.3*/("""}"""),format.raw/*123.4*/("""
		else"""),format.raw/*124.7*/("""{"""),format.raw/*124.8*/("""//check all
			for(var i=0; i<formats.length; i++)"""),format.raw/*125.39*/("""{"""),format.raw/*125.40*/("""
				formats[i].checked=true;
				$('#' + defaults[i].id).toggle(true);
			"""),format.raw/*128.4*/("""}"""),format.raw/*128.5*/("""
		"""),format.raw/*129.3*/("""}"""),format.raw/*129.4*/("""
		return false;
	"""),format.raw/*131.2*/("""}"""),format.raw/*131.3*/("""
	//For making visibility toggle
	//If format is selected/unselected
	$(function () """),format.raw/*134.16*/("""{"""),format.raw/*134.17*/("""
		$('.format').change(function () """),format.raw/*135.35*/("""{"""),format.raw/*135.36*/("""
			//div id for corresponding default checkbox
			var divId="inputDir_"+this.value;
			//id of default check box
			var checkId="dirBool_"+this.value;
			//div id for corresponding path prompt
			var divIdPrompt="dirPrompt_"+this.value;
			//If using format
			if(this.checked)"""),format.raw/*143.20*/("""{"""),format.raw/*143.21*/("""
				if($('#' + checkId).is(':checked'))"""),format.raw/*144.40*/("""{"""),format.raw/*144.41*/("""//default is checked
					//make prompt invisible
					$('#' + divIdPrompt).toggle(false);
				"""),format.raw/*147.5*/("""}"""),format.raw/*147.6*/("""
				else"""),format.raw/*148.9*/("""{"""),format.raw/*148.10*/("""
					//make prompt visible
					$('#' + divIdPrompt).toggle(true);
				"""),format.raw/*151.5*/("""}"""),format.raw/*151.6*/("""
			"""),format.raw/*152.4*/("""}"""),format.raw/*152.5*/("""
			//Hide input prompt if not using this format
			else"""),format.raw/*154.8*/("""{"""),format.raw/*154.9*/("""
				$('#' + divId).toggle(false);
				$('#' + divIdPrompt).toggle(false);
			"""),format.raw/*157.4*/("""}"""),format.raw/*157.5*/("""
			//toggle default input checkbox
			$('#' + divId).toggle(this.checked);
		"""),format.raw/*160.3*/("""}"""),format.raw/*160.4*/(""").change(); //ensure visible state matches initially
	"""),format.raw/*161.2*/("""}"""),format.raw/*161.3*/(""");
	//If default is selected/unselected
	$(function () """),format.raw/*163.16*/("""{"""),format.raw/*163.17*/("""
		$('.defaultDirBool').change(function () """),format.raw/*164.43*/("""{"""),format.raw/*164.44*/("""
			//div id for corresponding path prompt
			var divId="dirPrompt_"+this.value;
			//Toggle prompt div visibility
			$('#' + divId).toggle(!this.checked);
		"""),format.raw/*169.3*/("""}"""),format.raw/*169.4*/(""").change(); //ensure visible state matches initially
	"""),format.raw/*170.2*/("""}"""),format.raw/*170.3*/(""");
	</script>
	
	
    <h1>Create a new Regression Test</h1>
    
    <form name="newRun" action=""""),_display_(Seq[Any](/*176.34*/routes/*176.40*/.NewRun.addNewRun())),format.raw/*176.59*/("""" method="POST" >    
        <fieldset>
        
            <div class="clearfix">
				<label for="name">Run Name</label>
				<div class="input">
					<input id="name" type="text" value="" name="name" required pattern="(\w|\s|\.|-)+">
					<span class="help-inline">Required, only word characters</span>
				</div>
			</div>
			
			"""),_display_(Seq[Any](/*187.5*/select(
                runForm("platform.id"),
                options(Platform.options()),
                '_label -> "Platform", '_default -> "-- Choose a Platform --",
                '_showConstraints -> true
            ))),format.raw/*192.14*/("""
			
			<div class="clearfix">
				<div class="row">
					<div class="span3">
						<label for="formats">Formats </label>
					</div>
					<div class="span4">
						<button class="btn" onClick="return selectFormats();">Select/Deselect all</button></br>
					</div>
					<div class="span5">
						<span class="help-inline">Input should be a path to the directory of files</br>
									Ex. D:\Geoff\RTFs</br>
						<b>Note: D:\</b></span>
					</div>
				</div>
				"""),_display_(Seq[Any](/*208.6*/for((file,index) <- FileFormat.getList.zipWithIndex) yield /*208.58*/{_display_(Seq[Any](format.raw/*208.59*/("""
					<div class="row">
						<div class="input span3">
								<input class="format" type="checkbox" name="format" id="format_"""),_display_(Seq[Any](/*211.73*/index)),format.raw/*211.78*/("""" value=""""),_display_(Seq[Any](/*211.88*/file/*211.92*/.name)),format.raw/*211.97*/("""">
								<span>"""),_display_(Seq[Any](/*212.16*/file/*212.20*/.name)),format.raw/*212.25*/("""<span>
								<br/>
						</div>
						<div class="span4 defaults" id="inputDir_"""),_display_(Seq[Any](/*215.49*/file/*215.53*/.name)),format.raw/*215.58*/("""">
								<input class="defaultDirBool" type="checkbox" checked="true" name="defaultDirBool" id="dirBool_"""),_display_(Seq[Any](/*216.105*/file/*216.109*/.name)),format.raw/*216.114*/("""" value=""""),_display_(Seq[Any](/*216.124*/file/*216.128*/.name)),format.raw/*216.133*/("""">
								<span>Use default input directory?</span>
								<br/>
						</div>
						<div class="clearfix span6" id="dirPrompt_"""),_display_(Seq[Any](/*220.50*/file/*220.54*/.name)),format.raw/*220.59*/(""""> """),format.raw/*220.103*/("""
							<label for="inputDir">Input Directory</label>
							<div class="input">
								<input id="inputDir-"""),_display_(Seq[Any](/*223.30*/file/*223.34*/.name)),format.raw/*223.39*/("""" type="text" value=""""),_display_(Seq[Any](/*223.61*/file/*223.65*/.defInputDir)),format.raw/*223.77*/("""" name="inputDir" required>
							</div>
						</div>
					</div>
				""")))})),format.raw/*227.6*/("""
				<input type="hidden" name="formats" id="formats" value="">
				<input type="hidden" name="inputDirs" id="inputDirs" value="">
			</div>
			
			
			<div class="clearfix">
				<label for="compDir">Comparison Directory</label>
				<div class="input">
					<input id="compDir" type="text" value="" name="compDir" required>
					<span class="help-inline">Required</br>
					Input should be a folder name in '\\snowtest\Regression\(java|native)\'</br>
					Ex. 13.5-Build2-AFP</span>
				</div>
			</div>
			
        </fieldset>
        
        <div class="actions">
            <input type="submit" value="Output .Bat" class="btn primary" onclick='return checkForm("output")'> or 
            <a href=""""),_display_(Seq[Any](/*247.23*/routes/*247.29*/.Application.index())),format.raw/*247.49*/("""" class="btn">Cancel</a> 
        </div>
        
    </form>
    
""")))})))}
    }
    
    def render(runForm:Form[models.NewRun]): play.api.templates.Html = apply(runForm)
    
    def f:((Form[models.NewRun]) => play.api.templates.Html) = (runForm) => apply(runForm)
    
    def ref: this.type = this

}
                /*
                    -- GENERATED --
                    DATE: Tue Jul 23 11:40:05 EDT 2013
                    SOURCE: C:/Users/acarey/Desktop/andrewregressionsite/regressionsite/app/views/newRun.scala.html
                    HASH: c718762b3dddcc16fba74dcecbfb91b0a4733a9e
                    MATRIX: 737->1|853->56|885->80|969->31|999->53|1028->134|1068->140|1088->152|1127->154|1271->263|1285->269|1337->300|1442->377|1471->378|1698->577|1727->578|1789->612|1818->613|1872->640|1900->641|1931->645|1959->646|2065->724|2094->725|2182->786|2210->787|2271->820|2300->821|2391->885|2419->886|2454->894|2482->895|2546->932|2574->933|2604->936|2632->937|2699->976|2728->977|2867->1089|2895->1090|2952->1119|2981->1120|3090->1201|3119->1202|3250->1306|3278->1307|3513->1515|3541->1516|3609->1556|3638->1557|3866->1757|3895->1758|4000->1836|4028->1837|4269->2051|4297->2052|4357->2084|4386->2085|4963->2634|4992->2635|5082->2698|5110->2699|5367->2928|5396->2929|5451->2956|5480->2957|5576->3026|5604->3027|5662->3057|5691->3058|5754->3094|5782->3095|5818->3104|5846->3105|5969->3200|5998->3201|6035->3210|6064->3211|6100->3219|6129->3220|6179->3242|6208->3243|6239->3246|6268->3247|6324->3274|6354->3275|6600->3492|6630->3493|6692->3526|6722->3527|6777->3554|6806->3555|6838->3559|6867->3560|6914->3578|6944->3579|7026->3632|7056->3633|7164->3713|7193->3714|7225->3718|7254->3719|7290->3727|7319->3728|7399->3779|7429->3780|7535->3858|7564->3859|7596->3863|7625->3864|7673->3884|7702->3885|7818->3972|7848->3973|7913->4009|7943->4010|8258->4296|8288->4297|8358->4338|8388->4339|8514->4437|8543->4438|8581->4448|8611->4449|8714->4524|8743->4525|8776->4530|8805->4531|8891->4589|8920->4590|9029->4671|9058->4672|9167->4753|9196->4754|9279->4809|9308->4810|9394->4867|9424->4868|9497->4912|9527->4913|9718->5076|9747->5077|9830->5132|9859->5133|10000->5237|10016->5243|10058->5262|10440->5608|10695->5840|11213->6322|11282->6374|11322->6375|11490->6506|11518->6511|11565->6521|11579->6525|11607->6530|11663->6549|11677->6553|11705->6558|11827->6643|11841->6647|11869->6652|12015->6760|12030->6764|12059->6769|12107->6779|12122->6783|12151->6788|12321->6921|12335->6925|12363->6930|12396->6974|12546->7087|12560->7091|12588->7096|12647->7118|12661->7122|12696->7134|12804->7210|13565->7934|13581->7940|13624->7960
                    LINES: 26->1|29->5|29->5|30->1|32->4|33->5|35->7|35->7|35->7|37->9|37->9|37->9|40->12|40->12|44->16|44->16|45->17|45->17|47->19|47->19|48->20|48->20|50->22|50->22|53->25|53->25|54->26|54->26|57->29|57->29|58->30|58->30|60->32|60->32|61->33|61->33|62->34|62->34|64->36|64->36|65->37|65->37|67->39|67->39|69->41|69->41|76->48|76->48|77->49|77->49|81->53|81->53|83->55|83->55|89->61|89->61|90->62|90->62|105->77|105->77|107->79|107->79|118->90|118->90|119->91|119->91|122->94|122->94|123->95|123->95|125->97|125->97|126->98|126->98|129->101|129->101|131->103|131->103|132->104|132->104|134->106|134->106|135->107|135->107|136->108|136->108|141->113|141->113|142->114|142->114|144->116|144->116|145->117|145->117|146->118|146->118|147->119|147->119|150->122|150->122|151->123|151->123|152->124|152->124|153->125|153->125|156->128|156->128|157->129|157->129|159->131|159->131|162->134|162->134|163->135|163->135|171->143|171->143|172->144|172->144|175->147|175->147|176->148|176->148|179->151|179->151|180->152|180->152|182->154|182->154|185->157|185->157|188->160|188->160|189->161|189->161|191->163|191->163|192->164|192->164|197->169|197->169|198->170|198->170|204->176|204->176|204->176|215->187|220->192|236->208|236->208|236->208|239->211|239->211|239->211|239->211|239->211|240->212|240->212|240->212|243->215|243->215|243->215|244->216|244->216|244->216|244->216|244->216|244->216|248->220|248->220|248->220|248->220|251->223|251->223|251->223|251->223|251->223|251->223|255->227|275->247|275->247|275->247
                    -- GENERATED --
                */
            
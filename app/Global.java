import play.Application;
import play.GlobalSettings;
import play.Logger;
import play.libs.Akka;
import java.util.Date;
import scala.concurrent.duration.Duration;
import java.util.concurrent.TimeUnit;
import scala.concurrent.duration.FiniteDuration;

import org.quartz.CronExpression;

public class Global extends GlobalSettings {
	
	// See "http://quartz-scheduler.org/api/2.2.0/org/quartz/CronExpression.html" for formatting
	String timing = "0 00 10 ? * *"; //second minute hour day-of-month month day-of-week year(optional)

	@Override
	public void onStart(Application application) {
		super.onStart(application); 
		schedule(); 
	}

	private void schedule() {
		akka.actor.Cancellable c = null;//Can cancel with c.cancel() (if not null)
		try {
			//When to run it
			CronExpression e = new CronExpression(timing); //Timing set before
			//Find out when it will be run next
			Date nextValidTimeAfter = e.getNextValidTimeAfter(new Date());
			//How long from now it will be run
			FiniteDuration d = Duration.create(
				nextValidTimeAfter.getTime() - System.currentTimeMillis(), TimeUnit.MILLISECONDS);
			//Log info
			Logger.debug("Scheduling to run at "+nextValidTimeAfter);
			
			//Create Cancellable task
			c = Akka.system().scheduler().scheduleOnce(d, new Runnable() {
				@Override
				public void run() {//What actually gets run
					Logger.debug("Running scheduler");
					//Do your tasks here
					System.out.println("Ran at: "+new Date());//Example task
					
					schedule(); //Schedule for next time
				}
			}, Akka.system().dispatcher());
		}catch (java.lang.IllegalStateException e){
			//Caught every time the CronExpression is modified
			Logger.error("Error caused by reloading application", e);
		}catch (Exception e) {
			Logger.error("", e);
		}
	}
}
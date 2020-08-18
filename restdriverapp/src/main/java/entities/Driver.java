package entities;

import java.text.SimpleDateFormat;

import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement
public class Driver {

	private String name;
	private int id;
	private String password;
	private SimpleDateFormat daystart;
	private SimpleDateFormat dayend;
	private SimpleDateFormat journeystart;
	private SimpleDateFormat journeyend;
	private boolean daylog;
	private boolean journeylog;
	
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	@Override
	public String toString() {
		return "Driver [name=" + name + ", id=" + id + ", daystart=" + daystart + ", dayend=" + dayend
				+ ", journeystart=" + journeystart + ", journeyend=" + journeyend + ", daylog=" + daylog
				+ ", journeylog=" + journeylog + "]";
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public SimpleDateFormat getDaystart() {
		return daystart;
	}
	public void setDaystart(SimpleDateFormat daystart) {
		this.daystart = daystart;
	}
	public SimpleDateFormat getDayend() {
		return dayend;
	}
	public void setDayend(SimpleDateFormat dayend) {
		this.dayend = dayend;
	}
	public SimpleDateFormat getJourneystart() {
		return journeystart;
	}
	public void setJourneystart(SimpleDateFormat journeystart) {
		this.journeystart = journeystart;
	}
	public SimpleDateFormat getJourneyend() {
		return journeyend;
	}
	public void setJourneyend(SimpleDateFormat journeyend) {
		this.journeyend = journeyend;
	}
	public boolean isDaylog() {
		return daylog;
	}
	public void setDaylog(boolean daylog) {
		this.daylog = daylog;
	}
	public boolean isJourneylog() {
		return journeylog;
	}
	public void setJourneylog(boolean journeylog) {
		this.journeylog = journeylog;
	}

}

package com.ofss.main.domain_pan;

public class DateRange {
 public String from;
 public String to;
 
 public DateRange() {
	 
 }
 

public DateRange(String from, String to) {
	super();
	this.from = from;
	this.to = to;
}


public String getFrom() {
	return from;
}


public void setFrom(String from) {
	this.from = from;
}


public String getTo() {
	return to;
}


public void setTo(String to) {
	this.to = to;
}


@Override
public String toString() {
	return "DateRange [from=" + from + ", to=" + to + "]";
}


 
 
}

package com.ofss.main.domain_pan;

public class Frequency {
	private String unit;
	private int value;
	private int repeats;
	
	public Frequency() {
		
	}
	public Frequency(String unit, int value, int repeats) {
		super();
		this.unit = unit;
		this.value = value;
		this.repeats = repeats;
	}
	public String getUnit() {
		return unit;
	}
	public void setUnit(String unit) {
		this.unit = unit;
	}
	public int getValue() {
		return value;
	}
	public void setValue(int value) {
		this.value = value;
	}
	public int getRepeats() {
		return repeats;
	}
	public void setRepeats(int repeats) {
		this.repeats = repeats;
	}
	@Override
	public String toString() {
		return "Frequency [unit=" + unit + ", value=" + value + ", repeats=" + repeats + "]";
	}
	
	
}

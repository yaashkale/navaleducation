package com.ofss.main.domain_pan;

public class Permission {
	
	    private String access;
	    private DateRange dateRange;
	    private Frequency frequency;
	    
	    public Permission() {
	    	
	    }
	    
		public Permission(String access, DateRange dateRange, Frequency frequency) {
			super();
			this.access = access;
			this.dateRange = dateRange;
			this.frequency = frequency;
		}

		public String getAccess() {
			return access;
		}

		public void setAccess(String access) {
			this.access = access;
		}

		public DateRange getDateRange() {
			return dateRange;
		}

		public void setDateRange(DateRange dateRange) {
			this.dateRange = dateRange;
		}

		public Frequency getFrequency() {
			return frequency;
		}

		public void setFrequency(Frequency frequency) {
			this.frequency = frequency;
		}

		@Override
		public String toString() {
			return "Permission [access=" + access + ", dateRange=" + dateRange + ", frequency=" + frequency + "]";
		}
		
		
	    
	    
	    
	    
	    
	
}

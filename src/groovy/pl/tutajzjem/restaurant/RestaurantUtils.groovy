package pl.tutajzjem.restaurant

class RestaurantUtils {
	
	static final Date OPEN_DATE
	static final Date CLOSE_DATE
	static final Date LUNCH_OPEN_DATE
	static final Date LUNCH_CLOSED_DATE
	
	static {
		Calendar cal = Calendar.getInstance()
		cal.set(Calendar.HOUR_OF_DAY, 10)
		cal.set(Calendar.MINUTE, 0)
		OPEN_DATE = cal.getTime()
		
		cal.set(Calendar.HOUR_OF_DAY, 22)
		CLOSE_DATE = cal.getTime()
		
		cal.set(Calendar.HOUR_OF_DAY, 11)
		LUNCH_OPEN_DATE = cal.getTime()
		
		cal.set(Calendar.HOUR_OF_DAY, 14)
		LUNCH_CLOSED_DATE = cal.getTime()
	}
	
	static Date getOpenDefaultDate() {
		return OPEN_DATE
	}
	
	static Date getCloseDefaultDate() {
		return CLOSE_DATE
	}
	
	static Date getLuchOpenDefaultDate() {
		return LUNCH_OPEN_DATE
	}
	
	static Date getLunchCloseDefaultDate() {
		return LUNCH_CLOSED_DATE
	}
	
	static String getHourFromDate(Date date) {
		Calendar cal = Calendar.getInstance()
		cal.setTime(date)
		Integer hour = cal.get(Calendar.HOUR_OF_DAY)
		hour = hour==0 ? 24 : hour
		return hour.toString()
	}
	
	static String getMinuteFromDate(Date date) {
		Calendar cal = Calendar.getInstance()
		cal.setTime(date)
		Integer minute = cal.get(Calendar.MINUTE)
		if (minute==0) {
			return "00"
		}
		return minute.toString()
	}
	
	static int getCurrentWeekDay() {
		Calendar cal = Calendar.getInstance()
		return cal.get(Calendar.DAY_OF_WEEK)
	}
	
	static Date createDate(String hours, String minutes) {
		Calendar cal = Calendar.getInstance()
		cal.set(Calendar.HOUR_OF_DAY, Integer.parseInt(hours))
		cal.set(Calendar.MINUTE, Integer.parseInt(minutes=="00"?"0":minutes))
		return cal.getTime()
	}
}

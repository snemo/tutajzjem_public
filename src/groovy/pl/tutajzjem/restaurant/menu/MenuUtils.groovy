package pl.tutajzjem.restaurant.menu

class MenuUtils {

	static int parseWeek(String weekYear) {
		return Integer.parseInt(weekYear.split("-")[1]);
	}
	
	static int parseYear(String weekYear) {
		return Integer.parseInt(weekYear.split("-")[0]);
	}
	
	static String createYearWeek(int week, int year) {
		return "${year}-${week}";
	}
	
	static String getYearWeek(Date date) {
		Date monday = getMonday(date);
		Calendar cal = Calendar.getInstance()
		cal.setTime(monday);
		
		int week = cal.get(Calendar.WEEK_OF_YEAR)
		int year = cal.get(Calendar.YEAR)
		
		return createYearWeek(week, year);
	}
	
	static String getCurrentYearWeek() {
		return getYearWeek(new Date());
	}
	
	static Date getMonday(Date date) {
		Calendar cal = Calendar.getInstance()
		cal.setTime(date);
		cal.setFirstDayOfWeek(Calendar.MONDAY)
		cal.set(Calendar.DAY_OF_WEEK, Calendar.MONDAY);
		return cal.getTime();
	}
	
	static Date getFirstDayOfYearWeek(int year, int week) {
		Calendar cal = Calendar.getInstance()
		cal.setFirstDayOfWeek(Calendar.MONDAY)
		cal.set(Calendar.YEAR, year)
		cal.set(Calendar.WEEK_OF_YEAR, week)
		cal.set(Calendar.DAY_OF_WEEK, Calendar.MONDAY);
		return cal.getTime();
	}
	
	static Date getLastDayOfYearWeek(int year, int week) {
		Calendar cal = Calendar.getInstance()
		cal.setFirstDayOfWeek(Calendar.MONDAY)
		cal.set(Calendar.YEAR, year)
		cal.set(Calendar.WEEK_OF_YEAR, week)
		cal.set(Calendar.DAY_OF_WEEK, Calendar.SUNDAY);
		return cal.getTime();
	}
	
	static Calendar getCalendar(int year, int week) {
		Calendar cal = Calendar.getInstance()
		cal.setFirstDayOfWeek(Calendar.MONDAY)
		cal.set(Calendar.YEAR, year)
		cal.set(Calendar.WEEK_OF_YEAR, week)
		cal.set(Calendar.DAY_OF_WEEK, Calendar.MONDAY);
		return cal
	}
	
	static Calendar getCalendar(String yearWeek) {
		int year = parseYear(yearWeek)
		int week = parseWeek(yearWeek)
		return getCalendar(year, week)
	}
	
	static String addWeek(String yearWeek, int amount) {
		Calendar cal = getCalendar(yearWeek)
		cal.add(Calendar.WEEK_OF_YEAR, amount)
		return getYearWeek(cal.getTime())
	}
	
	static List<Date> getWeekDays(String yearWeek) {
		Calendar cal = getCalendar(yearWeek)
		List<Date> weekDays = new ArrayList<Date>()
		
		for(int i=0; i<7; i++) {
			weekDays.add(cal.getTime())
			cal.add(Calendar.DAY_OF_YEAR, 1)
		}
		return weekDays
	}
	
	static boolean isCurrentDate(Date date) {
		Calendar cal = Calendar.getInstance()
		Calendar cal2 = Calendar.getInstance()
		cal2.setTime(date)
		
		if (cal.get(Calendar.YEAR) == cal2.get(Calendar.YEAR) && cal.get(Calendar.DAY_OF_YEAR) == cal2.get(Calendar.DAY_OF_YEAR)) {
			return true
		}
		return false
	}
	
}

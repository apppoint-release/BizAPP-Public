CREATE FUNCTION GetWorkingDays
(
	@startdate datetime, @enddate datetime
)
RETURNS int
AS
BEGIN
	declare @days int
	select @days = COUNT(*) from calendar WITH (nolock) where 
	calendar_currentdate between @startdate and @enddate
	and ( (calendar_isholiday is null or calendar_isholiday = 0) 
		and (calendar_isnonworkingday is null or calendar_isnonworkingday = 0 )
	)
	
	return @days
END


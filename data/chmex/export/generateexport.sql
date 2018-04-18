DECLARE @chain VARCHAR(500)
DECLARE @height INT

DECLARE @cnt INT 
DECLARE cur_go CURSOR FOR
SELECT RTRIM(LTRIM(chain)), height FROM _Chain
OPEN cur_go

fetch next FROM cur_go INTO @chain, @height
WHILE @@fetch_Status = 0 BEGIN

SET @cnt = @height
WHILE @cnt >=0 BEGIN

PRINT '~/komodo/src/komodo-cli -ac_name=' + @chain + ' getblock ' + CAST(@cnt AS VARCHAR) + ' > export/' +@chain + '.' +  CAST(@cnt AS VARCHAR) + '.height'

SET @cnt = @cnt -1
END


fetch next FROM cur_go INTO @chain, @height
END
CLOSE cur_go
DEALLOCATE cur_go

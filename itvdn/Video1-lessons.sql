-- Data types --
 -- BIT tipi 0 ve 1 aralqinda value ala bilir
 -- 0 ve 1 den ferqli nese verilse de avtomatik cevirecek
declare @bit BIT=3

declare @ad nvarchar(20)='Aliagha';
print @ad
print @bit

-- TinyInt -- 
-- 0-255 arasi deyer alir
-- eger bu intervaldan ferqli nese versek o zaman error verecek
declare @tinyDigit tinyint=255
print @tinyDigit

-- SmallMoney --
declare @money1 SmallMoney
-- pul tipi. vergulden sonra iki reqem saxliyir avtomatik ve yuvaqlaqlasdirir
set @money1=34.45656
print @money1

declare @money2 Money
set @money2=345.455678
print @money2

-- Decimal(p,s)
-- burada p umumi ededde olacaq reqemlerin sayini, s ise vergulden sonra nece reqem olacaq onu gosterir
declare @dec decimal(5,3) -- burada eded 5 reqemli olacaq. bunun 3-u vergulden sonraya, qalan 2si vergulden evvele dusecek
set @dec=23.45678  -- burada qalacaq 23.457
print @dec

set @dec=234.4567 -- bu error verecek cunki vergulden sonra 3 reqem qalir ve vergulden evvele de 3 reqem qoydugumuza gore say 6 olacaq

declare @string varchar(5)
set @string='avc' -- burada lazimi diger 2 simvolun evezine probel dusecek. Yeni limitde verilen yeri tutacaq,baxmayaraq ki biz limitden az yazmisiq
print @string

set @string='asdasdasd' -- burada ise 5ni yazacaq qalanlarin silecek
print @string
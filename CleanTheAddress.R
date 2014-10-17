# The following code scans the address field to extract zip and state. Unfortunately the original data was never 
# as promised.
#

nsdata <- read.table("C:/Users/shubhro/Programming/Rprogramming/swissdata/combined.txt", header=TRUE,
fill=TRUE,sep="\t",colClasses=c("character","character","character","character","character",
        "character","numeric","character","character","character","character","character"))

st_index = grep("*[A-z][A-z]\\s*[0-9][0-9][0-9][0-9]*",nsdata$Address[])

#st_index = grep("*[A-z][A-z]\\s|'-'*[0-9][0-9][0-9][0-9]*'-'*[0-9][0-9]*",nsdata$Address[])

extract =  str_sub(nsdata$Address[st_index],start=-10, end = -1)

check = gregexpr("*[A-z][A-z]\\s*[0-9][0-9][0-9][0-9]*",extract)

#check = gregexpr("*[A-z][A-z]\\s|'-'*[0-9][0-9][0-9][0-9]*'-'*[0-9][0-9]*",extract)

stcodeall = regmatches(extract,check)

stcodeUP = toupper(stcodeall) 

nsdata$X[st_index] = stcodeUP

##
#statecode = regmatches(nsdata$Address[],st)
#x = "1 Bridgewater Common, Bridgewater, CT 06752"
#statecode[length(statecode):nrow(nsdata)] = " " 
#y = regmatches(x,regexpr("*[A-Z][A-Z]",x))

write.table(nsdata[],file = "C:/Users/shubhro/Programming/Rprogramming/swissdata/xfcombo.csv", sep = ",")

#for (i in 1:nrow(nsdata)) { 
#        for ( j in 1:nrow(states)) { 
#          m = regexpr(states[j,],nsdata$Address[i],fixed=TRUE)}
#          n = unlist(regmatches(nsdata$Address[i],m))
# x = "1522 3rd St SW, Wadema, MN 56482"
#X         print(n)        
#          nsdata$X[i] = regmatches(nsdata$Address[i],m)
#}

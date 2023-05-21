#!/usr/bin/env ruby

time = Time.new()

minute_offset = ((time.min - 3) % 60) / 5

said_minutes = [' five past', ' ten past', ' quarter past', ' twenty past', ' twenty-five past', ' half past', ' twenty-five to', ' twenty to', ' quarter to', ' ten to', ' five to']
prefix = said_minutes[minute_offset]

hour = time.hour
hour += 1 if time.min >= 33

said_hours = [' twelve', ' one', ' two', ' three', ' four', ' five', ' six', ' seven', ' eight', ' nine', ' ten', ' eleven']
hour = said_hours[hour % 12]

oclock = ((time.min <= 2 || time.min >= 58) and " o'clock" or '')

puts "It's#{prefix}#{hour}#{oclock}."

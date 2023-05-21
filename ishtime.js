#!/usr/bin/env node

const minutes = [
    'five past',
    'ten past',
    'quarter past',
    'twenty past',
    'twenty-five past',
    'half past',
    'twenty-five to',
    'twenty to',
    'quarter to',
    'ten to',
    'five to',
];

const hours = [
    'twelve',
    'one',
    'two',
    'three',
    'four',
    'five',
    'six',
    'seven',
    'eight',
    'nine',
    'ten',
    'eleven'
];

function ishtime(date) {
    let hour = date.getHours();
    const minute = date.getMinutes();
    if (minute >= 33) {
        hour++;
    }
    hour = hour % 12;

    const minute_index = Math.floor(((minute - 3) % 60) / 5);

    if (minute <= 2 || minute >= 58) {
        return `It's ${hours[hour]} o'clock.`;
    } else {
        return `It's ${minutes[minute_index]} ${hours[hour]}.`;
    }
}

if (typeof require !== "undefined" && require.main === module) {
    let now = new Date(Date.now());
    console.log(ishtime(now));
}

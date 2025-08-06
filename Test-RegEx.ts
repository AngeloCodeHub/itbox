/*
pattern
找出孔位、mac、IP
*/
const S0 = "1       f02f.74f6.56f8    static      eth-0-5";
const S1 = "1       f02f.74f6.65de    dynamic     eth-0-32";
const S2 = "/ip arp add address=192.168.1.240 comment=WK-01 interface=bonding1 mac-address=10:7B:44:A1:AD:CD";
const S3 = "/ip arp add address=192.168.1.25 interface=bonding1 mac-address=08:BF:B8:40:3A:E2";
const S4 = "/ip arp add address=192.168.1.236 interface=bonding1";

// const regexSwitch = /([0-9a-f]{4}\.[0-9a-f]{4}\.[0-9a-f]{4})\s+\S+\s+eth-0-(\d\d?)/i;
const regexSwitch = /([0-9a-f]{4}\.[0-9a-f]{4}\.[0-9a-f]{4})\s+\S+\s+(eth-0-[1-4][0-8]?)/i;

// 找出S2 address=後面的位址，與mac-address=後面的位址，中間所有字元忽略
const regexRouter = /address=(\d+\.\d+\.\d+\.\d+).*mac-address=([a-f0-9]{2}:[a-f0-9]{2}:[a-f0-9]{2}:[a-f0-9]{2}:[a-f0-9]{2}:[a-f0-9]{2})/i;

const match = S1.match(regexSwitch);
const match1 = S3.match(regexRouter);

const re = /(\.|:)/gi;
if (match && match1) {

  match[1] = match[1].replaceAll(re, '');
  console.log(match[1]);

  match1[2] = match1[2].replaceAll(re, '');
  console.log(match1[2]);

  let data: { [key: string]: { switch: number; ip: string; port: string } } = {};

  data[match1[2]] = {
    switch: 1,
    ip: match1[1],
    port: match[2],
  };
  // await Bun.write("./build/MAC.json", JSON.stringify(data, null, 2));
  // console.log(data);
}


// console.log(RegExp.prototype);




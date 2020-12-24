//  k6 run --summary-trend-stats "min,avg,max,med,p(75),p(90),p(95),p(99),p(99.99)" --out influxdb=https://influxdb.int.vinid.dev/k6 Lending_Merchant_GET_search_agent.js 

import http from "k6/http";
import papaparse from "../Libraries/papaparse.js"
import { check, fail } from "k6";
import { Rate } from "k6/metrics";

export let errorRate = new Rate("errors");

var USERS = 100;
let RAMP_UP = "10s";
let RUNNING = "120s";
let REDUCE_RUNNING = "3s";


var TEST_URl="https://google.com.vn";

// export let options = {
//     vus: 1,
//     iterations: 1
// };

// export let options = {
//      stages: [
//        { target: USERS, duration: RAMP_UP },
//        { target: USERS, duration: RUNNING },
//        { target: 0, duration: REDUCE_RUNNING },
//      ]
//    };
export default function(){
  var params={ 
    headers: { 
      "Content-Type": "application/json",
      "Accept-Language": "vi"
    } 
  };
  var body_param=JSON.stringify(
      {
        "username": "84367269897",
        "userType": "msisdn",
        "pin": "041191",
        "loginType": "BASIC"
      });  
  let res =http.get(TEST_URl,params);
  //let res=http.post(TEST_URl,body_param,params);
  let success = check(res, {"200": (r) => r.status === 200});
  check(res, {
      "400": (r) => r.status == 400,
      "401": (r) => r.status == 401,
      "404": (r) => r.status == 404,
      "429": (r) => r.status == 429,
      "500": (r) => r.status == 500,
      "502": (r) => r.status == 502,
      "503": (r) => r.status == 503,
      "521": (r) => r.status == 521
  });
}
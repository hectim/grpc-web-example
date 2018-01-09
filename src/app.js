import { List } from './proto/lms_pb.js'
import { API } from './proto/lms_pb_service.js'
import { grpc, Code } from 'grpc-web-client'

function createList() {
  const list = new List();
  list.setListId('1')
  list.setOrgId('2')
  list.setRegionId('3')
  list.setName('brady')
  grpc.unary(API.CreateList, {
    request: list,
    host: "http://localhost:8080/",
    onMessage: l => {
      console.log('got a message', l)
    },
    onEnd: res => {
      const { status, statusMessage, headers, message, trailers } = res;
      console.log("createList.onEnd.status", status, statusMessage);
      console.log("createList.onEnd.headers", headers);
      if (status === Code.OK && message) {
        console.log("createList.onEnd.message", message.toObject());
      }
      console.log("createList.onEnd.trailers", trailers);
    }
  });
}

setTimeout(() => { createList() }, 2000)

A small gRPC Web example without Typescript. Heavily influenced from:
- https://github.com/improbable-eng/grpc-web
- https://github.com/easyCZ/grpc-web-js-example

### Usage
1. Install node packages with `npm i`
2. Compile protos with `npm run proto`
3. Run your api server locally (I used one called "lmsctl") `./bin/lmsctl start api`
4. (optional?) Generate some bogus certificates https://serverfault.com/questions/224122/what-is-crt-and-key-and-how-can-i-generate-them
5. Run the gRPC Web proxy and point it at your api server
`grpcwebproxy --server_tls_cert_file=host.cert --server_tls_key_file=host.key --backend_addr=localhost:50051 --backend_tls_noverify`
6. Start dev server with `npm start`

load localhost in a browser and check the console

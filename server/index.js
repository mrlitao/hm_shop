// server.js
const http = require('http');

// 轮播图数据
const bannersData = [
  {
    id: "1",
    imgUrl: "https://gips2.baidu.com/it/u=122592237,1590356808&fm=3074&app=3074&f=PNG?w=2560&h=1440"
  },
  {
    id: "2",
    imgUrl: "https://img2.baidu.com/it/u=1061400568,287117462&fm=253&app=120&f=JPEG?w=1422&h=800"
  },
  {
    id: "3",
    imgUrl: "https://img1.baidu.com/it/u=1429816280,399532766&fm=253&app=120&f=JPEG?w=1422&h=800"
  },
  {
    id: "4",
    imgUrl: "https://img1.baidu.com/it/u=3864742034,3939810037&fm=253&fmt=auto&app=120&f=JPEG?w=1422&h=800"
  }
];

const APIS = {
  "GET": {
    "/banners": bannersData
  }
}

const server = http.createServer((req, res) => {
  // 设置 CORS 头，方便前端跨域调试
  res.setHeader('Access-Control-Allow-Origin', '*');
  res.setHeader('Access-Control-Allow-Methods', 'GET, OPTIONS');
  res.setHeader('Access-Control-Allow-Headers', 'Content-Type');

  // 处理预检请求
  if (req.method === 'OPTIONS') {
    res.writeHead(204);
    res.end();
    return;
  }

  // 路由：GET /banners
  const { url, method } = req
  const data = APIS[method]?.[url]

  if (!data) {
    // 其他路径返回 404
    res.writeHead(404, { 'Content-Type': 'application/json; charset=utf-8' });
    res.end(JSON.stringify({ code: "0", msg: "接口不存在" }));
  } else {
    res.writeHead(200, { 'Content-Type': 'application/json; charset=utf-8' });
    res.end(JSON.stringify({ code: "1", msg: "成功", data }));
  }
});

const PORT = 3000;
server.listen(PORT, () => {
  console.log(`✅ 服务器已启动: http://127.0.0.1:${PORT}`);
  console.log(`📡 轮播图接口: http://127.0.0.1:${PORT}/banners`);
});
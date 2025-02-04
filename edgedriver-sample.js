// 使用bun會有問題，改用node runtime執行

import { start } from 'edgedriver';
import { remote } from 'webdriverio';
import waitPort from 'wait-port';

/**
 * first start EdgeDriver
 */
const cp = await start({ port: 4444 });

/**
 * wait for EdgeDriver to be up
 */
// await waitPort({ port: 4444 });

/**
 * then start WebdriverIO session
 */
const browser = await remote({ capabilities: { browserName: 'msedge' } });
await browser.url('https://webdriver.io');
console.log(await browser.getTitle()); // prints "WebdriverIO · Next-gen browser and mobile automation test framework for Node.js | WebdriverIO"

/**
 * kill Edgedriver process
 */
cp.kill();
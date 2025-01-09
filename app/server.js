const express = require('express');
const path = require('path');
const app = express();
const port = process.env.PORT || 3000;

const replicaApp = process.env.APP_NAME || 'app';

app.use('/images', express.static(path.join(__dirname, 'images')));

app.get('/', (req, res) => {
    res.sendFile(path.join(__dirname, 'index.html'));
    console.log(`Request served from ${replicaApp}`);
});

app.get('/health', (req, res) => {
    res.json({ status: 'healthy', container: `${replicaApp}` });
});

app.listen(port, () => {
    console.log(`${replicaApp} is listening on port ${port}`);
});

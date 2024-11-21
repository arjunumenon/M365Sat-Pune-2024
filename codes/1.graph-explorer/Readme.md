# About

This is the demo where we will be covering the following topics:

- Use 
- Use Dev Proxy to throttle the Graph API call in the explorer
- Get the mock data even in your Graph Explorer

## 1. Intercept any call from your Command-line

```bash
devproxy
```

### Invoke Web API and see the result

```bash
    curl -ix http://localhost:8000 https://jsonplaceholder.typicode.com/posts
```

## 2. Intercept any call from your Graph Explorer

```bash
devproxy --config-file "m365.json"
```

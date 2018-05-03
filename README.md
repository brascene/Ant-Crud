# Ant-Crud
Basic server CRUD app with Swift and Vapor with PostgreSQL driver

#Routes

The base URL = *https://cryptic-waters-45764.herokuapp.com/*

### Create new ant
/ants
with json body e.g.
`{
	"age": 62,
	"name": "alen",
	"position": "mobile"
}`

### Update ant by Id
PUT request, /ant/Id
Use the same json as above

### Get ant by Id
/ant/Id

### Get all ants
/all_ants

### Delete ant by Id
DELETE request, /ant/Id


<p align="center">
    <img src="https://cloud.githubusercontent.com/assets/1342803/24797159/52fb0d88-1b90-11e7-85a5-359fff0496a4.png" width="320" alt="MySQL">
    <br>
    <br>
    <a href="http://beta.docs.vapor.codes/getting-started/hello-world/">
        <img src="http://img.shields.io/badge/read_the-docs-92A8D1.svg" alt="Documentation">
    </a>
    <a href="http://vapor.team">
        <img src="http://vapor.team/badge.svg" alt="Slack Team">
    </a>
    <a href="LICENSE">
        <img src="http://img.shields.io/badge/license-MIT-brightgreen.svg" alt="MIT License">
    </a>
    <a href="https://circleci.com/gh/vapor/mysql">
        <img src="https://circleci.com/gh/vapor/mysql.svg?style=shield" alt="Continuous Integration">
    </a>
    <a href="https://travis-ci.org/vapor/api-template">
    	<img src="https://travis-ci.org/vapor/api-template.svg?branch=master" alt="Build Status">
    </a>
    <a href="https://swift.org">
        <img src="http://img.shields.io/badge/swift-3.1-brightgreen.svg" alt="Swift 3.1">
    </a>
</center>

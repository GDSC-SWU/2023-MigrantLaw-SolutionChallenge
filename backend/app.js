const convert = require('xml-js');
const request = require('request');
const express = require('express');
const app = express();
const port = 8080

const { PrismaClient } = require('@prisma/client')
const prisma = new PrismaClient()

app.listen(port, () => console.log('Example app listening on port 8080!'));

function getLaw(req, res, next) {
    const lawId = req.params.id
    var requestUrl = `https://www.law.go.kr/DRF/lawService.do?target=law&OC=rucy0716&type=XML&MST=${lawId}`
    request.get(requestUrl, (err,res,body) =>{
        if(err){
            console.log(`err => ${err}`)
        }
        else {
            if(res.statusCode == 200){
                var result = body
                var xmlToJson = convert.xml2json(result , {compact: true, spaces: 4});
                const json = JSON.parse(xmlToJson)
                req.json = json
                next();
            }
        }
    })
};

app.get('/law/:id', getLaw, async(req, res) => {
    try{
        var result = req.json
        res.send(result)
    }catch(err){
        console.log(err)
        res.status(500).send({error:'Server Error.'});
    }
})

////////////////////////////////////////////////////////////
app.get('/db/:id', getLaw, async(req, res) => {
    const category = req.params.id
    try{
        var result = req.json
        result.법령.조문.조문단위.map(item => savetodb(item, category))
        res.send("good")
    }catch(err){
        console.log(err)
        res.status(500).send({error:'Server Error.'});
    }
})

async function savetodb(item, category) {
    var jomunTitle = item.조문제목
    var jomunStartDay = item.조문시행일자._text
    var jomunContent = item.조문내용._cdata
    var jomunReference = item.조문참고자료
    var hang
    const jomunKey = item._attributes.조문키

    if(item.조문제목 == undefined){
        jomunTitle = ''
    } else {
        jomunTitle = jomunTitle._cdata
    }

    if(item.조문참고자료 == undefined){
        jomunReference = ''
    } else {
        jomunReference = jomunReference._cdata
    }
    if(item.항 == undefined){
        hang = []
    } else {
        hang = item.항
    }

    console.log(hang)

    try{
        await prisma.lawJson.create({
        data:{
            category: category,
            jomunKey: jomunKey,
            jomunTitle: jomunTitle,
            jomunStartDay: jomunStartDay,
            jomunContent: jomunContent,
            jomunReference: jomunReference,
            hang: hang
        },
        })
    } catch (error) {
        console.error(error);
    }
}

app.get('/search/:id', async(req, res) => {
    const category = req.params.id
    var keyword = req.query.q;

        try{
            const result = await prisma.lawJson.findMany({
                select: {
                    jomunKey: true,
                    jomunTitle: true,
                    jomunStartDay: true,
                    jomunContent: true,
                    jomunReference: true,
                    hang: true
                },
                where: {
                    OR: [
                        {jomunTitle: {string_contains: keyword}},
                        {jomunContent: {string_contains: keyword}}
                    ],
                    AND: [
                        {category: {equals: category}}
                    ]
                },
                orderBy: {
                    jomunKey: 'asc'
                },
            })
            if(result.length == 0) {
                res.send({ message: 'No result.' })
            }else {
                res.send(result)
            }
    
        }catch(err){
            console.log(err)
            res.status(500).send({error:'Server Error.'});
        }
})

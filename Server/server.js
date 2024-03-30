var express = require( 'express' );
var cors = require ('cors');
var { initializeApp } =  require ( "firebase/app" );
var { collection, getFirestore, getDoc, getDocs, addDoc, query, doc, where, deleteDoc } = require ("firebase/firestore");


var app = express();
app.use(cors());
app.use(express.json());

// ----------------------------------------------------------------------------------------------------------------------------------
// ----------------------------------------------------------------------------------------------------------------------------------
// -----------------------------------------------------FIREBASE CONFIGURATION-------------------------------------------------------
const key = 
{
    apiKey: "AIzaSyBcX-H5dV8nAxq6QihykXCgWBwAMoKODfc",
    authDomain: "hsuengquizapp.firebaseapp.com",
    projectId: "hsuengquizapp",
    storageBucket: "hsuengquizapp.appspot.com",
    messagingSenderId: "981487120365",
    appId: "1:981487120365:web:48683a4a203f25757c41e4"
}

var fb = initializeApp(key);
var db = getFirestore(fb);

var recordCol = collection(db, "records");
var userCol = collection(db, "users");
var questionCol = collection(db, "questions");
// ----------------------------------------------------------------------------------------------------------------------------------
// ----------------------------------------------------------------------------------------------------------------------------------
// ------------------------------------------------------CRUD for Records------------------------------------------------------------

app.get("/records", async (req, res) =>
{
    var result = await getDocs(recordCol);
    var listData = [];
    result.forEach((r) =>
    {
        console.log(r.data());
        listData.push(r.data());
    })
    res.send(listData);
})

app.post("/records/post", async (req, res) =>
{
    var date = Date();
    console.log(date);
    var result = await addDoc(recordCol, 
    {
        "username": req.body.username,
        "record": req.body.record,
        "datetime": date,
    })
})

// ----------------------------------------------------------------------------------------------------------------------------------
// ----------------------------------------------------------------------------------------------------------------------------------
// ------------------------------------------------------CRUD for Questions----------------------------------------------------------

app.get("/questions", async (req, res) =>
{
    var result = await getDocs(questionCol);
    var listData = [];
    result.forEach((r) =>
    {
        console.log(r.data());
        listData.push(r.data());
    })
    res.send(listData);
})

app.post("/questions/post", async (req, res) =>
{
    try
    {
        var result = await addDoc(questionCol, 
        {
            "qid": req.body.qid,
            "question": req.body.question,
            "point": req.body.point,
            "timer": req.body.timer,
            "correct_ans": req.body.correct_ans,
            "difficulty": req.body.difficulty,
            "ans1": req.body.ans1,
            "ans2": req.body.ans2,
            "ans3": req.body.ans3,
            "ans4": req.body.ans4,
        }).then(()=>
        {
            console.log(`Added question with ID: ${req.body.qid} successfully!`);
            res.status(333).send(`Added question with ID: ${req.body.qid} successfully!`);
        })
    }
    catch(err)
    {
        console.log(`Required fields: (int)qid, (string)question, (int)point, (double)timer, (int)correct_ans, (string)difficulty, (string) ans1, (string)ans2, (string)ans3, (string)ans4, please check again and specify them!`);
        res.status(567).send(`Required fields: (int)qid, (string)question, (int)point, (double)timer, (int)correct_ans, (string)difficulty, (string) ans1, (string)ans2, (string)ans3, (string)ans4, please check again and specify them!, hoi Hien di`);
    }
})

app.delete("/delete/questions/all", async (req, res) =>
{
    try
    {
        var q = query(questionCol);
        var result = (await getDocs(q)).docs;
        result.map((r) =>
        {
            deleteDoc(r.ref);
        })
        console.log("Successfully deleted " + result.length + " from collection Questions");
        res.status(234).send("Successfully deleted " + result.length + " from collection Questions");
    }
    catch (err)
    {
        console.log("Error deleting collection Questions, reason: " + err);
        res.send("Error deleting collection Questions, reason: " + err)
    }
})

// ----------------------------------------------------------------------------------------------------------------------------------
// ----------------------------------------------------------------------------------------------------------------------------------
// ------------------------------------------------------CRUD for Users--------------------------------------------------------------

app.get("/users", async (req, res) =>
{
    var result = await getDocs(userCol);
    var listData = [];
    result.forEach((r) =>
    {
        console.log(r.data());
        listData.push(r.data());
    })
    res.send(listData);
})

app.post("/users/register", async (req, res) =>
{
    try
    {
        if (!(await getDocs(query(userCol, where("username", "==", req.body.username)))).empty)
        {
            res.status(567).send("Username " + req.body.username + " already existed in the database");
            console.log("Username " + req.body.username + " already exists in the database");
            return;
        }
        var result = await addDoc(userCol,
        {
            "username": req.body.username,
            "password": req.body.password
        })
        .then(() =>
        {
            console.log(`Added user with username: ${req.body.username}, and password: ${req.body.password}`);
            res.status(234).send(`Added user with username: ${req.body.username}, and password: ${req.body.password}`);
        })
    }
    catch (err)
    {
        console.log(`Required fields: (string)username, (string)password, please specify them.`);
        res.send(`Required fields: (string)username, (string)password, please specify them. Ko duoc nua thi hoi Hien`);
        console.log(err);
    }
})

app.delete("/delete/users/:username", async (req, res) =>
{
    try
    {
        var q = query(userCol, where("username", "==", req.params.username));
        var r = (await getDocs(q)).docs.at(0);
        if (r == null) throw err;
        deleteDoc(r.ref);
        console.log("Successfully deleted user with username: " + req.params.username);
        res.status(234).send("Successfully deleted user with username: " + req.params.username);
    }
    catch
    {
        console.log("No such username, check again");
        res.status(567).send("No such username, check again, ko duoc thi hoi Hien`");
    }
})

app.delete("/delete/users/all", async (req, res) =>
{
    try
    {
        var q = query(userCol);
        var result = (await getDocs(q)).docs;
        result.map((r) =>
        {
            deleteDoc(r.ref);
        })
        console.log("Successfully deleted " + result.length + " from collection Users");
        res.status(234).send("Successfully deleted " + result.length + " from collection Users");
    }
    catch (err)
    {
        console.log("Error deleting collection Users, reason: " + err);
        res.send("Error deleting collection Users, reason: " + err)
    }
})

// ----------------------------------------------------------------------------------------------------------------------------------
// ----------------------------------------------------------------------------------------------------------------------------------
// ------------------------------------------------------LOGIN-----------------------------------------------------------------------


app.post("/login", async (req, res) =>
{
    var result = (await getDocs(query(userCol, where("username", "==", req.body.username)))).docs


    if (result.at(0).data().password === req.body.password)
    {
        console.log(`Login successfully as user ${req.body.username}`);
        res.status(234).send(`Login successfully as user ${req.body.username}`);
        return;
    }
    console.log(`Invalid username or password`);
    res.status(567).send(`Invalid username or password`);
})



app.listen(8080, ()=>console.log("Server is online"));
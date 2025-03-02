var express = require( 'express' );
var cors = require ('cors');
var { initializeApp } =  require ( "firebase/app" );
var { collection, getFirestore, getDoc, getDocs, addDoc, query, doc, where, deleteDoc, updateDoc } = require ("firebase/firestore");


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
    res.status(234).send(listData);
})

app.get("/records/:email", async (req, res) => {
    try {
        var results = (await getDocs(query(recordCol, where("email", "==", req.params.email)))).docs.map(doc => doc.data());
        res.status(234).send(results);
    } catch (error) {
        console.error(error);
        res.status(567).json({ message: 'An error occurred', error: error.toString() });
    }
});


    app.post("/records/post", async (req, res) => {
        try {
            var result = await addDoc(recordCol, {
                "email": req.body.email,
                "score": req.body.score,
                "difficulty": req.body.difficulty,
                "datetime": req.body.datetime,
            });
            console.log(`Added record with Email: ${req.body.email}, Score: ${req.body.score}, Difficulty: ${req.body.difficulty}, and Datetime: ${req.body.datetime}`);
            res.status(234).send();
        } catch (error) {
            console.error(error);
            res.status(567).json({ message: 'An error occurred', error: error.toString() });
        }
    });

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
    console.log(listData);
    res.send(listData);
})

app.get("/questions/easy", async (req, res) =>
{
    var result = await getDocs(query(questionCol, where("difficulty", "==", "easy")));
    var listData = []
    var LIMIT = 5;
    
    while (listData.length < LIMIT)
    {
        result.forEach((r) =>
        {
            var random = !!Math.round(Math.random());
            if (random)
            {
                if(listData.push(r.data()) == LIMIT)
                {
                    return;
                }
            }
        })
    }
    console.log(listData.slice(0, LIMIT).length);
    res.status(234).send(listData.slice(0, LIMIT));
})

app.get("/questions/medium", async (req, res) =>
    {
        var result = await getDocs(query(questionCol, where("difficulty", "==", "medium")));
        var listData = []
        var LIMIT = 10;
        
        while (listData.length < LIMIT)
        {
            result.forEach((r) =>
            {
                var random = !!Math.round(Math.random());
                if (random)
                {
                    if(listData.push(r.data()) == LIMIT)
                    {
                        return;
                    }
                }
            })
        }
        console.log(listData.slice(0, LIMIT).length);
        res.status(234).send(listData.slice(0, LIMIT))
    })

app.get("/questions/hard", async (req, res) =>
{
    var result = await getDocs(query(questionCol, where("difficulty", "==", "hard")));
    var listData = []
    var LIMIT = 15;
    
    while (listData.length < LIMIT)
    {
        result.forEach((r) =>
        {
            var random = !!Math.round(Math.random());
            if (random)
            {
                if(listData.push(r.data()) == LIMIT)
                {
                    return;
                }
            }
        })
    }
    console.log(listData.slice(0, LIMIT).length);
    res.status(234).send(listData.slice(0, LIMIT))
})

app.post("/questions/post", async (req, res) =>
{
    try
    {
        var result = await addDoc(questionCol, 
        {
            "qid": req.body.qid,
            "question": req.body.question,
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
            res.status(234).send(`Added question with ID: ${req.body.qid} successfully!`);
        })
    }
    catch(err)
    {
        console.log(`Required fields: (int)qid, (string)question, (double)timer, (int)correct_ans, (string)difficulty, (string) ans1, (string)ans2, (string)ans3, (string)ans4, please check again and specify them!`);
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

    app.get("/users/:email", async (req, res) => {
    try {
        const result = await getDocs(query(userCol, where("email", "==", req.params.email)));
        if (result.empty) {
            res.status(567).send(`No user found with email: ${req.params.email}`);
            return;
        }
        const user = result.docs[0].data();
        res.status(234).send(user);
    } catch (err) {
        console.error("Error retrieving user:", err);
        res.status(567).send("An error occurred while retrieving the user.");
    }
});


app.put("/users/:email", async (req, res) =>
{
    try
    {
        var result = await getDocs(query(userCol, where("email", "==", req.params.email)))
        var id;
        if (result.empty)
        {
            res.status(567).send("No username with email " + req.params.email);
            return
        }
        result.forEach((doc) => {
            id = doc.id;
        })
        //var result = (await getDocs(query(userCol, where("email", "==", req.params.email)))).docs.at(0);
        await updateDoc(doc(userCol, id), {
            "email": req.params.email,
            "password": req.body.password,
            "username": req.body.username,
        }).then(()=> {
            res.status(234).send("Successfully updated user with email " + req.params.email + " to username " + req.body.username);
            console.log(("Successfully updated user with email " + req.params.email + " to username " + req.body.username));
        });
    }
    catch(e)
    {
        console.log(e)
        res.send("Body must contain 'password', 'username' fields");
    }
})

app.post("/users/register", async (req, res) => {
    try {
        const { email, password, username } = req.body;

        // Check if email already exists
        if (!(await getDocs(query(userCol, where("email", "==", email)))).empty) {
            res.status(567).send("Email " + email + " already exists in the database");
            console.log("Email " + email + " already exists in the database");
            return;
        }

        // Check if username already exists
        if (!(await getDocs(query(userCol, where("username", "==", username)))).empty) {
            res.status(567).send("Username " + username + " already exists in the database");
            console.log("Username " + username + " already exists in the database");
            return;
        }

        // Add new user
        var result = await addDoc(userCol, {
            email: email,
            password: password,
            username: username
        });

        console.log(`Added user with Email: ${email}, Password: ${password}, and Username: ${username}`);
        res.status(234).send({ email, password, username });
    } catch (err) {
        console.log(`Required fields: (string)email, (string)password, (string)username, please specify them.`);
        res.send(`Required fields: (string)email, (string)password, (string)username, please specify them. If you have any issues, please contact support.`);
        console.log(err);
    }
});

app.delete("/delete/users/:email", async (req, res) =>
{
    try
    {
        var q = query(userCol, where("email", "==", req.params.email));
        var r = (await getDocs(q)).docs.at(0);
        if (r == null) throw err;
        deleteDoc(r.ref);
        console.log("Successfully deleted user with Email: " + req.params.email);
        res.status(234).send("Successfully deleted user with Email: " + req.params.email);
    }
    catch
    {
        console.log("No such user with Email: " + req.params.email + ", check again");
        res.status(567).send("No such user with Email: " + req.params.email + ", check again. Ko dc nua thi hoi Hien`");
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
    var result = (await getDocs(query(userCol, where("email", "==", req.body.email)))).docs


    if (result.at(0).data().password === req.body.password)
    {
        console.log(`Login successfully as user ${req.body.email}`);
        // res.status(234).send({"email": req.body.email,
        // "password": req.body.password});
        res.status(234).send();
        return;
    }
    console.log(`Invalid email or password`);
    res.status(567).send(`Invalid email or password`);
    return; 
})



app.listen(8080, ()=>console.log("Server is online"));
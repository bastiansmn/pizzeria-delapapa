const path = require('path');
const fs = require('fs');

module.exports = (app, db) => {
   fs.readdir(path.join(__dirname, "."), (err, files) => {
      if (err) throw Error("Impossible de lire les composants");
      files.forEach(file => {
         const extension = path.extname(file);
         const baseName = file.split(".")[0];
         const namespace = file.split(".")[1] ?? "";
         if (extension === ".js" && baseName !== "index" && namespace === "component") {
            require(`./${baseName}.component`)(app, db);
         }
      });
   });
}

JSONObject json;

void setup(){
 json = loadJSONObject("http://10.0.0.188/d3dapi/config/all");
 json = json.getJSONObject("data");
 println(json.getInt("printer.temperature"));
}

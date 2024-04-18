from django.shortcuts import render

# Create your views here.
class Calories():

    # 1gm (protiene) = 4 calories
    def get_protine_calories(value,units):
        if units == "g" or units=="G":
            result = value*4
        elif units=="mg" or units=="MG":
            result = value*0.004
        elif units=="kg" or units=="KG":
            result = value*4000
        else:
            result = 0
        return result


    def get_carbs_calories(value,units):
        if units == "g" or units=="G":
            result = value*4
        elif units=="mg" or units=="MG":
            result = value*0.004
        elif units=="kg" or units=="KG":
            result = value*4000
        else:
            result = 0
        return result


    def get_fats_calories(value,units):
        if units == "g" or units=="G":
            result = value*9
        elif units=="mg" or units=="MG":
            result = value*0.009
        elif units=="kg" or units=="KG":
            result = value*9000
        else:
            result = 0
        return result
    

def homepage(request):
    return render(request,"home.html")       

def calculate_values(request):
   
    if request.method == "POST":
        result = float() #0.00
        carbs = request.POST.get('carbs')
        protine = request.POST.get('protine')
        fats = request.POST.get('fats')
        carbs_units = request.POST.get('carbs_units')
        protine_units = request.POST.get('protine_units')
        fats_units = request.POST.get('fats_units')
        if carbs:
            result+=Calories.get_carbs_calories(float(carbs),str(carbs_units))
            print(result)
        
        if protine:
            result+=Calories.get_protine_calories(float(protine),str(protine_units))
        
        if fats:
            result+=Calories.get_fats_calories(float(fats),str(fats_units))
        # print(result)
        return render(request,"calorie_cal.html",{"result":result,
                                            "carbs":carbs,
                                            "protine":protine,
                                            "fats":fats,
                                            "carbs_units":carbs_units,
                                            "protine_units":protine_units,
                                            "fats_units":fats_units,
                                            })
    return render(request,"calorie_cal.html")



def DVCalculator(request):
    nutrients= dict()
    nutrients= {
        "Carbohydrates" : [0,0,'g'],
        "Protein" : [0,0,'g'],
        "Fat" : [0,0,'g'],
        "Saturated_Fat" : [0,0,'g'],
        "Cholesterol" : [0,0,'mg'],
        "Sodium" : [0,0,'mg'],
        "Dietary_Fiber" : [0,0,'g'],
        "Added_Sugars" : [0,0,'g'],
        "Vitamin_A" : [0,0,'mcg'],
        "Vitamin_C" : [0,0,'mg'],
        "Calcium" : [0,0,'mg'],
        "Iron" : [0,0,'mg'],
        "Vitamin_D" : [0,0,'mcg'],
        "Vitamin_E" : [0,0,'mg'],
        "Vitamin_K" : [0,0,'mcg'],
        "Thiamin" : [0,0,'mg'],
        "Riboflavin" : [0,0,'mg'],
        "Niacin" : [0,0,'mg'],
        "Vitamin_B6" : [0,0,'mg'],
        "Folate" : [0,0,'mcg'],
        "Vitamin_B12" : [0,0,'mcg'],
        "Biotin" : [0,0,'mcg'],
        "Pantothenic_Acid" : [0,0,'mg'],
        "Phosphorous" : [0,0,'mg'],
        "Iodine" : [0,0,'mcg'],
        "Magnesium" : [0,0,'mg'],
        "Zinc" : [0,0,'mg'],
        "Selenium" : [0,0,'mcg'],
        "Copper" : [0,0,'mg'],
        "Manganese" : [0,0,'mg'],
        "Chromium" : [0,0,'mcg'],
        "Molybdenum" : [0,0,'mcg'],
        "Chloride" : [0,0,'mg'],
        "Potassium" : [0,0,'mg'],
        "Choline" : [0,0,'mg'],
        "Creatine":[0,0,'g'],
        "Caffeine":[0,0,'mg']
    }
    nutr= {
        "Carbohydrates" :"275000",
        "Protein" :"50000",
        "Fat" :"78000",
        "Saturated_Fat" :"20000",
        "Cholesterol" :"300",
        "Sodium" :"2300",
        "Dietary_Fiber" :"28000",
        "Added_Sugars" :"50000",
        "Vitamin_A" :"0.900",
        "Vitamin_C" :"90",
        "Calcium" :"1300",
        "Iron" :"18",
        "Vitamin_D" :"0.02",
        "Vitamin_E" :"15",
        "Vitamin_K" :"0.12",
        "Thiamin" :"1.2",
        "Riboflavin" :"1.3",
        "Niacin" :"16",
        "Vitamin_B6" :"1.7",
        "Folate" :"0.4",
        "Vitamin_B12" :"0.0024",
        "Biotin" :"0.03",
        "Pantothenic_Acid" :"5",
        "Phosphorous" :"1250",
        "Iodine" :"0.15",
        "Magnesium" :"420",
        "Zinc" :"11",
        "Selenium" :"0.055",
        "Copper" :"0.9",
        "Manganese" :"2.3",
        "Chromium" :"0.035",
        "Molybdenum" :"0.045",
        "Chloride" :"2300",
        "Potassium" :"4700",
        "Choline" :"550",
        "Creatine":"5000",
        "Caffeine":"400",
    }
    nutrients = dict(sorted(nutrients.items(), key=lambda x: x[0]))
    if request.method == "POST":
        val = 0
        org_val = 0
        unit = "mg"
        for nut in nutr:
            if request.POST.get(f"nut_{nut}"):
                val = float(request.POST.get(f"nut_{nut}"))
                org_val = val
            if request.POST.get(f"nut_{nut}_units"):
                unit = str(request.POST.get(f"nut_{nut}_units")).lower()
            if unit == "g":
                val = val*1000
            elif unit == "mg":
                val = val
            elif unit == "mcg":
                val = val/1000
            else:
                return render(request,"dv_cal.html",{"error_message":"wrong units"})
            nut_val = (val/float(nutr[nut]))*100
            nutrients[nut] = [org_val,"{:.4f}".format(round(nut_val, 4)),unit]
        return render(request,"dv_cal.html",{"nutrients":nutrients})
    return render(request,"dv_cal.html",{"nutrients":nutrients})
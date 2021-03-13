class PlantClass{
  final String title;
  final String description;
  final String image;
  final String reference;
  final List<Diseases> diseases;
  PlantClass({this.title,this.description,this.image,this.reference,this.diseases});

  static List<PlantClass> getPlantClass(){
    List<PlantClass> items = <PlantClass>[];

    items.add(PlantClass(title: "bell pepper",
    description: "Bell peppers, Capsicum annuum are a cultivar group of annual or perennial plants in the family Solanaceae grown for their edible fruits. Bell pepper plants are short bushes with woody stems that grow brightly colored fruits. "
    "The alternating leaves are elliptical, smooth edged, and come to a distinct point. The plant produces white or purple bell-shaped flowers which are 2.5 cm (1 in) in diameter. Red, yellow, purple, or brown fruit are produced"
    "each season about 3-6 weeks after flowering. Pepper plants can grow 1 m (3.3 ft) tall and are usually grown as annuals in temperate regions for only one growing season. Bell pepper may be referred to as red pepper, yellow pepper or green pepper "
    "and is believed to have originated in Central and South America."
    ,image: "bellpepper1.jpg",reference: "https://plantvillage.psu.edu/topics/pepper-bell/infos/diseases_and_pests_description_uses_propagation",
    diseases:Diseases.getBellPepperDiseases()));
    
    items.add(PlantClass(title:"potato",
    description:"Potato, Solanum tuberosum, is an herbaceous perennial plant in the family Solanaceae which is grown for its edible tubers. The potato plant has a branched stem and alternately arranged leaves consisting of leaflets which are both of unequal size and shape."
    " The leaflets can be oval to oblong in shape and the leaves can reach 10–30 cm (4–12 in) in length and 5–15 cm (2–6 in) wide. The potato plant produces white or blue flowers and yellow-green berries. The potato tubers grow underground and generally located in the top 25 cm (10 in) of the soil. "
    "The tubers can range in color from yellow to red or purple depending on the variety. Potato plants can reach in excess of 1 m (3.3 ft) in height and are grown as annual plants, surviving only one growing season. Potato may also be referred to as, spud, Irish potato, "
    "white potato or Spanish potato and originates from South America. "
     ,image: "potato1.jpg",reference: "https://plantvillage.psu.edu/topics/potato/infos",
     diseases: Diseases.getPotatoDiseases()));

    items.add(PlantClass(title:"Tomato",
    description:"Tomato, Lycopersicum esculentum (syn. Solanum lycopersicum and Lycopersicon lycopersicum) is an herbaceous annual in the family Solanaceae grown for its edible fruit. The plant can be erect with short stems or vine-like with long, spreading stems. The stems are covered"
    "in coarse hairs and the leaves are arranged spirally. The tomato plant produces yellow flowers, which can develop into a cyme of 3–12, and usually a round fruit (berry) which is fleshy, smoothed skinned and can be red, pink, purple, brown, orange or yellow in color. The tomato plant can grow 0.7–2 m (2.3–6.6 ft) in height "
    "and as an annual, is harvested after only one growing season. Tomato may also be referred to as love apple and originates from South America."
    ,image: "tomato1.jpg",reference: "https://plantvillage.psu.edu/topics/tomato/infos",
    diseases: Diseases.getTomatoDiseases()
    ));
  
  return items;
  }
}



class Diseases{
Diseases({this.image,this.name,this.symptoms,this.cause,this.comments,this.management});

final String image;
final String name;
final String symptoms;
final String cause;
final String comments;
final String management;


static List<Diseases> getBellPepperDiseases(){

  List<Diseases> disease = <Diseases>[];

  disease.add(Diseases(image:"bellpepper_bacterium.jpg",name: "bacterial Spot" ,symptoms:"Water-soaked lesions that dry out and turn brown forming on the underside of the leaves; raised brown cankers on stems; cracked brown lesions on fruit.",
  cause: "Bacterium",comments:"Disease emergence favored by warm, wet conditions; the pathogen can be enter a field on seed and transplants and can be spread within a field by wind-driven rain, clipping plants and aerosols.",
  management: "Use disease free planting material; remove and destroy all crop debris after harvest, or plow material deeply under soil."  
  ));
return disease;
}

static List<Diseases> getPotatoDiseases(){

  List<Diseases> disease = [];

  disease.add(Diseases(image: "potato_early_blight.jpg",name:"Potato Early Blight",symptoms: "Dark lesions with yellow border which may form concentric rings of raised and sunken tissue on the leaves and stems; lesions initially circular but become angular; leaves become necrotic but remain attached to plant; dark, dry lesions on tubers with leathery or corky texture and watery yellow0green margins",
  cause: "fungus",comments: "Disease emergence favors cycles of wet and dry conditions with periods of high humidity and leaf wetness",
  management:"Application of appropriate protective fungicide can reduce severity of foliar symptoms; reduce stress to plants by fertilizing and watering adequately; plant late varieties which are less susceptible to disease; store tubers in cool environment"
  ));

  disease.add(Diseases(image: "potato_late_blight.jpg",name:"Potato Late Blight ", symptoms: "Irregularly shaped spreading brown lesions on leaves with distinctive white fluffy sporulation at lesion margins on the underside of the leaf in wet conditions. In dry condition the lesions dry up and go dark brown with collapsed tissue; water-soaked dark green to brown lesions on stems also with characteristic white sporulation; later in infection leaves and petioles completely rotted; severely affected plants may have an slightly sweet distinctive odor; red-brown firm lesions on tubers extending several centimeters into tissue; lesions may be slightly sunken in appearance and often lead to secondary bacterial rots.",
  cause: "Oomycete",comments: "The pathogen can survive for several months to years in the soil; emergence of disease favored by moist, cool conditions; major cause of disease spread is infected tubers",
   management: "Control depends on a multifaceted approach with importance of certain practices changing based on geographic location: destroy infected tubers; destroy any volunteer plants; application of appropriate fungicide to potato hills at emergence; time watering to reduce periods of leaf wetness e.g. water early to allow plant to dry off during the day; plant resistant varieties; apply appropriate protective fungicide if disease is forecast in area"
   ));

  return disease;


}


static List<Diseases> getTomatoDiseases() {
  List<Diseases> disease = <Diseases>[];
  disease.add(Diseases(image:"tomato_bacterial_spot.jpg",name: "Bacterial Spot" ,
  symptoms: "Bacterial spot lesions starts out as small water-soaked spots; lesions become more numerous and coalesce to form necrotic areas on the leaves giving them a blighted appearance; of leaves drop from the plant severe defoliation can occur leaving the fruit susceptible to sunscald; mature spots have a greasy appearance and may appear transparent when held up to light; centers of lesions dry up and fall out of the leaf; blighted leaves often remain attached to the plant and give it a blighted appearance; fruit infections start as a slightly raised blister; lesions may have a faint halo which eventually disappears; lesions on fruit may have a raised margin and sunken center which gives the fruit a scabby appearance",
  cause: "Bacterium", comments:"Bacteria survive on crop debris; disease emergence favored by warm temperatures and wet weather; symptoms are very similar to other tomato diseases but only bacterial spot will cause a cut leaf to ooze bacterial exudate; the disease is spread by infected seed, wind-driven rain, diseased transplants, or infested soil; bacteria enter the plant through any natural openings on the leaves or any openings caused by injury to the leaves.",
  management:  "Use only certified seed and healthy transplants; remove all crop debris from planting area; do not use sprinkler irrigation, instead water from base of plant; rotate crops."
  ));

  disease.add(Diseases(image: "tomato_early_blight.jpg",name:"Tomato early blight",
  symptoms: "Early blight symptoms start as oval shaped lesions with a yellow chlorotic region across the lesion; concentric leaf lesions may be seen on infected leaves; leaf tissue between veins is destroyed; severe infections can cause leaves to completely collapse; as the disease progresses leaves become severely blighted leading to reduced yield; tomato stems may become infected with the fungus leading to Alternaria stem canker; initial symptoms of of stem canker are the development of dark brown regions on the stem; stem cankers may enlarge to girdle the whole stem resulting in the death of the whole plant; brown streaks can be found in the vascular tissue above and below the canker region; fruit symptoms include small black v-shaped lesions at the shoulders of the fruit (the disease is also known black shoulder); lesions may also appear on the fruit as dark flecks with concentric ring pattern; fruit lesions can seen in the field or may develop during fruit transit to the market; the lesions may have a velvety appearance caused by sporulation of the fungus",
  cause: "Fungus", comments: "Disease can spread rapidly after plants have set fruit; movement of air-borne spores and contact with infested soil are causes for the spread of the disease",
  management: "Apply appropriate fungicide at first sign of disease; destroy any volunteer solanaceous plants (tomato, potato, nightshade etc); practice crop rotation"));

  disease.add(Diseases(image:"tomato_late_blight.jpg",name: "Late blight",
  symptoms:"Late blight affects all aerial parts of the tomato plant; initial symptoms of the disease appear as water-soaked green to black areas on leaves which rapidly change to brown lesions; fluffy white fungal growth may appear on infected areas and leaf undersides during wet weather; as the disease progresses, foliage becomes becomes shriveled and brown and the entire plant may die; fruit lesions start as irregularly shaped water soaked regions and change to greasy spots; entire fruit may become infected and a white fuzzy growth may appear during wet weather.",
  cause:"Oomycete",comments: "Can devastate tomato plantings.",
  management:"Plant resistant varieties; if signs of disease are present or if rainy conditions are likely or if using overhead irrigation appropriate fungicides should be applied." 
  ));

  disease.add(Diseases(image: "tomato_leaf_mold.jpg", name: "leaf mold",
  symptoms: "The older leaves exhibit pale greenish to yellow spots (without distinguishable margins) on upper surface. Whereas the lower portion of this spots exhibit green to brown velvety fungal growth. As the disease progress the spots may coalesce and appear brown. The infected leaves become wither and die but stay attached to the plant. The fungus also infects flowers and fruits. The affected flowers become black and drop off. The affected fruit intially shows smooth black irregular area on the stem end but later it becomes sunken, leathery and dry.",
  cause:"fungus", comments: "The disease is favored by high relative humidity. Also a common disease in green house tomato crop.",
  management: "Grow available resistant varieties. Avoid leaf wetting and overhead application of water. Follow proper spacing to provide good air circulation around the plants. Remove the infected plant debris and burn them. If the disease is severe scary suitable fungicide." 
  ));

  disease.add(Diseases(image: "tomato_septoria.jpg",name:"SEPTORIA LEAF SPOT",
  symptoms: "Symptoms may occur at any stage of tomato development and begin as small, water-soaked spots or circular grayish-white spots on the underside of older leaves; spots have a grayish center and a dark margin and they may colasece; fungal fruiting bodies are visible as tiny black specks in the center of spot; spots may also appear on stems, fruit calyxes, and flowers.",
  cause: "fungus",comments: "Spread by water splash; fungus overwinters in plant debris.",
  management:"Ensure all tomato crop debris is removed and destroyed in Fall or plowed deep into soil; plant only disease-free material; avoid overhead irrigation; stake plants to increase air circulation through the foliage; apply appropriate fungicide if necessary."   
  ));

  disease.add(Diseases(image: "tomato_spider_mites.jpg",name:"SPIDER MITES",
  symptoms: "Leaves stippled with yellow; leaves may appear bronzed; webbing covering leaves; mites may be visible as tiny moving dots on the webs or underside of leaves, best viewed using a hand lens; usually not spotted until there are visible symptoms on the plant; leaves turn yellow and may drop from plant.",
  cause: "Arachnid",comments: "Spider mites thrive in dusty conditions; water-stressed plants are more susceptible to attack.",
  management:"In the home garden, spraying plants with a strong jet of water can help reduce buildup of spider mite populations; if mites become problematic apply insecticidal soap to plants; certain chemical insecticides may actually increase mite populations by killing off natural enemies and promoting mite reproduction." 
  ));

  disease.add(Diseases(image:"tomato_target_spot.jpg",name: "TARGET SPOT",
  symptoms: "The fungus infects all parts of plant. Infected leaves shows small, pinpoint, water soaked spots initially. As the disease progress the spots enlarge to become necrotic lesions with conspicuous concentric circles, dark margins and light brown centers. Whereas the fruits exhibit brown, slightly sunken flecks in the beginning but later the lesions become large pitted appearance.",
  cause: "fungus",comments: "The pathogen infects cucumber, pawpaw , ornamental plants, some weed species etc. The damaged fruits are susceptible for this disease.",
  management: "Remove the plant debris and burn them. Avoid over application of nitrogen fertilizer. If the disease is severe spray suitable fungicides."
  ));

  disease.add(Diseases(image: "tomato_yellow.jpg",name: "TOMATO YELLOW LEAF CURL DISEASE",
  symptoms: "The infected leaves become reduced in size, curl upward, appear crumpled and show yellowing of veins and leaf margins. The internodes become shorter and whole plant appear stunted and bushy. The whole plant stand erect with only upright growth. The flowers may not develop and drop off.",
  cause:"virus",comments: "The virus is transmitted by white flies and may cause 100 % yield loss if the plants infect at early stage of crop. The virus also infect other hosts like common bean, ornamental plants and several weed species.",
  management: "Grow available resistant varieties. Transplant only disease and whiteflies free seedlings. Remove the infected plants and burn them. Keep the field free from weeds. Use yellow sticky traps to monitor and control whiteflies. If the insect infestation is severe spray suitable insecticides."
  ));

  disease.add(Diseases(image: "tomato_mosaic.jpg", name: "TOMATO MOSAIC VIRUS",
  symptoms: "Symptoms can occur at any growth stage and any part of the plant can be affected; infected leaves generally exhibit a dark green mottling or mosaic; some strains of the virus can cause yellow mottling on the leaves; young leaves may be stunted or distorted; severely infected leaves may have raised green areas; fruit yields are reduced in infected plants; green fruit may have yellow blotches or necrotic spots; dark necrotic streaks may appear on the stems, petioles leaves and fruit.",
  cause: "virus",comments: "ToMV is a closely related strain of Tobacco mosaic virus (TMV), it enters fields via infected weeds, peppers or potato plants; the virus may also be transmitted to tomato fields by grasshoppers, small mammals and birds.",
  management: "Plant varieties that are resistant to the virus; heat treating seeds at 70°C (158°F) for 4 days or at 82–85°C (179.6–185°F) for 24 hours will help to eliminate any virus particles on the surface of the seeds; soaking seed for 15 min in 100 g/l of tri-sodium phosphate solution (TSP) can also eliminate virus particles - seeds should be rinsed thoroughly and laid out to dry after this treatment; if the virus is confirmed in the field, infected plants should be removed and destroyed to limit further spread; plant tomato on a 2-year rotation, avoiding susceptible crops such as peppers, eggplant, cucurbits and tobacco; disinfect all equipment when moving from infected areas of the field."));

return disease;
}

}
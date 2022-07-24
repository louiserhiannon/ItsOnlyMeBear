using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class TargetRaycast : MonoBehaviour
{
    private MeshRenderer meshRenderer;
    public Material materialOriginal;
    public Material materialHit;
    public Transform sprayNozzle;
   [SerializeField] private LayerMask layerMask;
    public int layer;
    private int layerAsLayerMask;
    
    // Start is called before the first frame update
    void Start()
    {
        meshRenderer = GetComponent<MeshRenderer>();
        meshRenderer.material = materialOriginal;
        layerAsLayerMask = (1 << layer);
    }

    // Update is called once per frame
    void FixedUpdate()
    {
        
        if (Physics.Raycast(sprayNozzle.transform.position, sprayNozzle.transform.TransformDirection(Vector3.forward), Mathf.Infinity, layerAsLayerMask))
        {
            meshRenderer.material = materialHit;
        }
        else
        {
            meshRenderer.material = materialOriginal;
        }
    }
}

using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ActivateSpray : MonoBehaviour
{
    //Check if bearSpray is stablized with second hand
    public bool canisterStabilized = false;

   

    private void OnTriggerEnter(Collider other)
    {
        if (other.tag == "player")
        {
            canisterStabilized = true;
        }
    }

    private void OnTriggerExit(Collider other)
    {
        if (other.tag == "player")
        {
            canisterStabilized = false;
        }
    }
}